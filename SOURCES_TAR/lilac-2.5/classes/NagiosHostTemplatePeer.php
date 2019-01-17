<?php

  // include base peer class
  require_once 'om/BaseNagiosHostTemplatePeer.php';

  // include object class
  include_once 'NagiosHostTemplate.php';


/**
 * Skeleton subclass for performing query and update operations on the 'nagios_host_template' table.
 *
 * Nagios Host Template
 *
 * This class was autogenerated by Propel on:
 *
 * Thu Dec 13 21:25:24 2007
 *
 * You should add additional methods to this class to meet the
 * application requirements.  This class will only be generated as
 * long as it does not already exist in the output directory.
 *
 * @package    
 */
class NagiosHostTemplatePeer extends BaseNagiosHostTemplatePeer {


    public function getByName($name) {
        $c = new Criteria();
        $c->add(NagiosHostTemplatePeer::NAME, $name);
        $c->setIgnoreCase(true);
        $template = NagiosHostTemplatePeer::doSelectOne($c);
        if(!$template) {
         return false;
        }
        return $template;
    }

} // NagiosHostTemplatePeer
