<?php
// This file generated by Propel 1.6.1 convert-conf target
// from XML runtime conf file /home/rene/dev/lilac-reloaded/runtime-conf.xml

date_default_timezone_set('Europe/Paris');

$conf = array (
  'datasources' => 
  array (
    'lilac' => 
    array (
      'adapter' => 'mysql',
      'connection' => 
      array (
        'dsn' => 'mysql:host=localhost;dbname=lilac',
        'user' => 'lilac',
        'password' => 'root66',
        'options' => 
        array (
          'ATTR_PERSISTENT' => 
          array (
            'value' => false,
          ),
        ),
      ),
    ),
    'default' => 'lilac',
  ),
  'log' => 
  array (
    'ident' => 'lilac',
    'level' => '0',
  ),
  'generator_version' => '1.6.1',
);
$conf['classmap'] = include(dirname(__FILE__) . DIRECTORY_SEPARATOR . 'classmap-lilac-conf.php');
return $conf;
