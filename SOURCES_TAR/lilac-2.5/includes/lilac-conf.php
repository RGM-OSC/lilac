<?php
// This file generated by Propel 1.3.0-dev convert-props target
// from XML runtime conf file /home/tdondich/dev/lilac/branches/lilac-1.x/runtime-conf.xml
return array_merge_recursive(array (
  'log' => 
  array (
    'ident' => 'lilac',
    'level' => '0',
  ),
  'propel' => 
  array (
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
    'generator_version' => '1.3.0-dev',
  ),
), include(dirname(__FILE__) . DIRECTORY_SEPARATOR . 'lilac-classmap.php'));
