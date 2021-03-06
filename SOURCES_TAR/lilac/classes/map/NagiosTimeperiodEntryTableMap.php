<?php



/**
 * This class defines the structure of the 'nagios_timeperiod_entry' table.
 *
 *
 *
 * This map class is used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    propel.generator..map
 */
class NagiosTimeperiodEntryTableMap extends TableMap
{

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = '.map.NagiosTimeperiodEntryTableMap';

	/**
	 * Initialize the table attributes, columns and validators
	 * Relations are not initialized by this method since they are lazy loaded
	 *
	 * @return     void
	 * @throws     PropelException
	 */
	public function initialize()
	{
		// attributes
		$this->setName('nagios_timeperiod_entry');
		$this->setPhpName('NagiosTimeperiodEntry');
		$this->setClassname('NagiosTimeperiodEntry');
		$this->setPackage('');
		$this->setUseIdGenerator(true);
		// columns
		$this->addPrimaryKey('ID', 'Id', 'INTEGER', true, null, null);
		$this->addForeignKey('TIMEPERIOD_ID', 'TimeperiodId', 'INTEGER', 'nagios_timeperiod', 'ID', false, null, null);
		$this->addColumn('ENTRY', 'Entry', 'VARCHAR', true, 255, null);
		$this->addColumn('VALUE', 'Value', 'VARCHAR', true, 255, null);
		// validators
	} // initialize()

	/**
	 * Build the RelationMap objects for this table relationships
	 */
	public function buildRelations()
	{
		$this->addRelation('NagiosTimeperiod', 'NagiosTimeperiod', RelationMap::MANY_TO_ONE, array('timeperiod_id' => 'id', ), 'SET NULL', null);
	} // buildRelations()

} // NagiosTimeperiodEntryTableMap
