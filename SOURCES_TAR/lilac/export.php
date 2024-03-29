<?php
/*
Lilac - A Nagios Configuration Tool
Copyright (C) 2018 EyesOfNetwork Team

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

/*
Lilac Export Page, Displays Menu, and Statistics
*/


include_once('includes/config.inc');

include_once('exporter/classes.inc.php');
include_once('ExportJob.php');
include_once('ExportLogEntry.php');

// Get Next Job Id
include("/srv/rgm/rgmweb/include/config.php");
$link = mysql_connect( $database_host, $database_username, $database_password );
mysql_select_db( $database_lilac );
$query = mysql_query( "SHOW TABLE STATUS LIKE 'export_job';" );
$resultID = mysql_fetch_object( $query );
mysql_close( $link );

// Better to load our engines!
$availableEngines = ExportEngine::getAvailableEngines();

if(isset($_GET['action']) && $_GET['action'] == "engineConfig") {
	// Need to send over engine configuration
	$engineClass = $_GET['className'];
	$engine = new $engineClass(null); // Wonky, I know.
	$engine->renderConfig($resultID->Auto_increment);
	die();
}

if(isset($_GET['id'])) {
	$exportJob = ExportJobPeer::retrieveByPK($_GET['id']);
	if(!$exportJob) {
		unset($exportJob);
	}
	
	if(isset($_GET['action']) && $_GET['action'] == "restart") {
		$exportJob->setStatusCode(ExportJob::STATUS_STARTING);
		$exportJob->setStartTime(time());
		$exportJob->setStatus("Starting...");
		$exportJob->save();
		exec("pkill -f 'php exporter/export.php' > /dev/null");
		exec("php exporter/export.php " . $exportJob->getId() . " > /dev/null", $tempOutput, $retVal);
		if($retVal != 42) {
			$error = "Failed to run external exporter script. Return value: " . $retVal . "<br /> Error:";
			foreach($tempOutput as $output) {
				$error .= $output . "<br />";
			}
		}
		else {
			// No need to show
			//$success = "Restarted Export Job";
		}
	}
	if(isset($_GET['action']) && $_GET['action'] == "stop") {
		if($exportJob->getStatusCode() < ExportJob::STATUS_FINISHED) {
			$exportJob->setStatusCode(ExportJob::STATUS_FAILED);
			$exportJob->setStatus("Stopped");
			$exportJob->addWarning("Stopped Export Job");
			$exportJob->save();
			exec("pkill -f 'php exporter/export.php' > /dev/null");
			$success = "Stopped Export Job";
		}
	}
}

if(isset($_GET['request']) && $_GET['request'] == 'status') {
	// We're our AJAX client wanting status information
	$result = array();
	$exportJob = ExportJobPeer::retrieveByPK($_GET['id']);
	if(!$exportJob) {
		$result['error'] = "Invalid job specified.";
		print(json_encode($result));
		exit();
	}
	// Okay, let's populate the status
	$result['start_time'] = $exportJob->getStartTime();
	$result['status_code'] = $exportJob->getStatusCode();
	$result['status_text'] = $exportJob->getStatus();
	$result['status_change_time'] = $exportJob->getStatusChangeTime();
	
	// Build elapsed time
	if(!in_array($exportJob->getStatusCode(), array(ExportJob::STATUS_FAILED, ExportJob::STATUS_FINISHED))) {
		$target = time();
	}
	else {
		$target = strtotime($result['status_change_time']);
	}
	$start = strtotime($result['start_time']);
	$total = $target - $start;
	$hours = (int)($total / 3600);
	$total = $total % 3600;
	$minutes = (int)($total / 60);
	$seconds = $total % 60;
	
	$result['elapsed_time'] = $hours . " Hours " . $minutes . " Minutes " . $seconds . " Seconds";

	print(json_encode($result));
	exit();
}

if(isset($_GET['request']) && $_GET['request'] == 'fetch') {
	// We're our AJAX client wanting to get new log data
	$result = array();
	$c = new Criteria();
	$c->add(ExportLogEntryPeer::JOB, $_GET['id']);
	$c->setLimit($_POST['rp']);
	$c->setOffset(isset($_POST['page']) ? ($_POST['page'] - 1) * $_POST['rp'] : 0);
	$c->addDescendingOrderByColumn(ExportLogEntryPeer::ID);
	$entries = $exportJob->getExportLogEntrys($c);
	foreach($entries as $entry) {
		$results['rows'][] = array('id' => $entry->getId(), 'cell' => array( $entry->getTime(),
									  $entry->getReadableType($entry->getType()),
									  rgm_esc($entry->getText())));
	}
	$c = new Criteria();
	$c->add(ExportLogEntryPeer::JOB, $exportJob->getId());
	$results['page'] = $_POST['page'];
	$results['total'] = ExportLogEntryPeer::doCount($c);
	?>

	<?php
	print(json_encode($results));
	

	exit();
}

if(isset($_POST['request'])) {
	if(!strlen(trim($_POST['job_name']))) {
		$status_msg = "Job name must be provided.";
	}
	else {
		// Instantiate an engine
		$engineClass = $_POST['job_engine'];
		$engine = new $engineClass(null); // Wonky, I know.
		$error = $engine->validateConfig();
	}
	if(empty($error)) {
		// All is good.  Let's create our job.
		$config = new ExportConfig($engineClass);		
		$engine->buildConfig($config);
		$exportJob = new ExportJob();
		$exportJob->setName($_POST['job_name']);
		$exportJob->setDescription($_POST['job_description']);
		$exportJob->setCmd(ExportJob::CMD_START);
		$exportJob->setConfig(serialize($config));
		$exportJob->setStartTime(time());
		$exportJob->setStatus("Starting...");
		$exportJob->setStatusCode(ExportJob::STATUS_STARTING);
		$exportJob->save();
		
		// Attempt to execute the external exporter script, fork it, and love it.
		exec("pkill -f 'php exporter/export.php ".$exportJob->getId()."' > /dev/null");
		exec("php exporter/export.php " . $exportJob->getId() . " > /dev/null", $tempOutput, $retVal);
		if($retVal != 42) {
			$error = "Failed to run external exporter script. Return value: " . $retVal . "<br /> Error:";
			foreach($tempOutput as $output) {
				$error .= $output . "<br />";
			}
		}	
	}
}


print_header("Exporter");


if(isset($exportJob)) {
	?>
    <script type="text/javascript">    
		$(document).ready(function() {
    	$("#joblog").flexigrid({
    		url: 'export.php?id=<?php echo $exportJob->getId();?>&request=fetch',
			dataType: 'json', // type of data loaded
			errormsg: 'There was a problem retrieving the error log.  Refresh and try again',
    		colModel: [
    		{display: 'Time', name: 'name', width: 100, sortable: true, align: 'left'},
    		{display: 'Type', name: 'type', width: 100, sortable: true, align: 'left'},
    		{display: 'Text', name: 'text', width: 1000, sortable: true, align: 'left'}
    			],
    		resizable: false, //resizable table
    		sortname: "time", 
    		sortorder: 'asc',
    		usepager: true,
    		procmsg: 'Grabbing Log Entries, please wait ...',
    		title: false,
    		showToggleBtn: false, //show or hide column toggle popup
    		useRp: true,
    		rp: 50,
    		height: 'auto'
    	});
    	<?php
    	if(!in_array($exportJob->getStatusCode(), array(ExportJob::STATUS_FINISHED, ExportJob::STATUS_FAILED))) {
    	    // Add check timer
    		?>
    		var timer = 0;
    		$(document).everyTime(2000, "status", function() {
    			// Call ajax
				$.getJSON("export.php?id=<?php echo $exportJob->getId();?>&request=status&tok=" + Math.random() , function(data) {
					$("#jobstatus").html(data.status_text);
					$("#elapsedtime").html(data.elapsed_time);
					
					if(data.status_code == <?php echo ExportJob::STATUS_FINISHED;?> || data.status_code == <?php echo ExportJob::STATUS_FAILED;?>) {
						if(data.status_code == <?php echo ExportJob::STATUS_FINISHED;?>) {
							$("#completemsg").show("slow").fadeIn("slow");
						}
						$(document).stopTime("status");
					}
				});
    		}, 0, true);
    		<?php
    	}
		?>

    });

    </script>
	<?php
}


?>
<style type="text/css">
fieldset {
border:1px solid #CCCCCC;
margin:1em 0pt;
padding:1em;
}
legend {
font-weight:bold;
}
label {
display:block;
}

.checks label {
width:15em;
display: inline;
float: none;
}

.checks p {
padding: 2px;
}
</style>
<?php
if(!isset($exportJob))	{
	$c = new Criteria();
	//$c->add(ExportJobPeer::END_TIME, null);
	$exportJobs = ExportJobPeer::doSelect($c);
	if($exportJobs) {
		print_window_header("Existing Export Jobs", "100%");
		?>
		There appears to be existing export jobs.  There should only be one running.  If there are multiple showing as running, you should cancel them or purge them.  Click on a job to 
		view it's progress and it's log.
		<table class="jobs">
		<tr>
			<td><strong>Name</strong></td>
			<td><strong>Description</strong></td>
			<td><strong>Start Time</strong></td>
			<td><strong>Status</strong></td>
			<td colspan="2"><strong>Actions</strong></td>
		</tr>
		<?php
		foreach($exportJobs as $job) {
			?>
			<tr>
				<td><?php echo rgm_esc($job->getName());?></td>
				<td><?php echo rgm_esc($job->getDescription());?></td>
				<td><?php echo rgm_esc($job->getStartTime());?></td>
				<td><?php echo rgm_esc($job->getStatus());?></td>
				<td><a class="btn btn-info" href="export.php?id=<?php echo $job->getId();?>">View Job</td>
				<td><a class="btn btn-primary" href="export.php?id=<?php echo $job->getId();?>&action=restart">Restart</a></td>
				<?php
				if($job->getStatusCode() < ExportJob::STATUS_FINISHED) {
				?>
					<td><a class="btn btn-warning" href="export.php?id=<?php echo $job->getId();?>&action=stop">Stop</a></td>
				<?php
				}
				?>
			</tr>
			<?php
		}
		?>
		</table>
		<?php
		print_window_footer();	
	}
}
else {

	$stats = $exportJob->getStats();
	if($stats) {
		$stats = unserialize($stats);
	}
	
	print_window_header("Job Details", "100%");
	?>
	<strong>Job Name:</strong> <?php echo $exportJob->getName();?><br />
	<strong>Job Id:</strong> <?php echo $exportJob->getId();?><br />
	<?php echo rgm_esc($exportJob->getDescription());?>
	<br />
	<strong>Start Time:</strong> <?php echo $exportJob->getStartTime();?><br />
	<br />
	<?php
	if(!in_array($exportJob->getStatusCode(), array(ExportJob::STATUS_FAILED, ExportJob::STATUS_FINISHED) )) {
		?>
		<strong>Elapsed Time:</strong> <span id="elapsedtime">Unknown</span>
		<?php
	}
	else {
		if($exportJob->getStatusCode() == ExportJob::STATUS_FAILED) {
			?>
			<strong>Time of Failure:</strong> <?php echo $exportJob->getStatusChangeTime();?>
			<?php
		}
		else {
			?>
			<strong>Time When Completed:</strong> <?php echo $exportJob->getStatusChangeTime();?>
			<?php
		}
	}
	?>
	<br />
	<strong>Current Status:</strong> <span id="jobstatus"><?php echo $exportJob->getStatus();?></span><br />
	<br />
	<strong>Job Supplemental:</strong>
	<ul>
	<?php
	$config = unserialize($exportJob->getConfig());
	$engineClass = $config->getEngineClass();
	$engine = new $engineClass($exportJob);
	$engine->showJobSupplemental();
	?>
	<br />
	<?php
	$config = unserialize($exportJob->getConfig());
	if($config->getVar("overwrite_main")) {
		?><strong>Exporting Main Configuration</strong><br /><?php
	}
	if($config->getVar("overwrite_resources")) {
		?><strong>Exporting Resources</strong><br /><?php
	}
	if($config->getVar("overwrite_cgi")) {
		?><strong>Exporting CGI Configuration</strong><br /><?php
	}
	?>
	<div id="completemsg" class="roundedcorner_success_box" <?php if($exportJob->getStatusCode() != ExportJob::STATUS_FINISHED ) { ?>style="display: none; margin-left:0px;"<?php } else { ?>style="margin-left:0px;"<?php } ?>>
	   <div class="roundedcorner_success_top"><div></div></div>
	      <div class="roundedcorner_success_content">
	      Export Job Complete. Content Exported Successfully.
	      </div>
	   <div class="roundedcorner_success_bottom"><div></div></div>
	</div>

	<a class="btn btn-primary" href="export.php?id=<?php echo $exportJob->getId();?>&action=restart">Restart Job</a>
	<a class="btn btn-warning" href="export.php?id=<?php echo $exportJob->getId();?>&action=stop">Stop Job</a>
	<a class="btn btn-default" href="export.php">Return To Exporter</a>
	<?php
	print_window_footer();
	print_window_header("Job Log");
	?>
		<div id="joblog">
		
		</div>
	<?php
	print_window_footer();
	
}

print_footer();

?>
