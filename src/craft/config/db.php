<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

define('CRAFT_DB_HOST', getenv('CRAFT_DB_HOST'));
define('CRAFT_DB_NAME', getenv('CRAFT_DB_NAME'));
define('CRAFT_DB_PASS', getenv('CRAFT_DB_PASS'));
define('CRAFT_DB_USER', getenv('CRAFT_DB_USER'));

return array(

	// The database server name or IP address. Usually this is 'localhost' or '127.0.0.1'.
	'server' => CRAFT_DB_HOST,

	// The database username to connect with.
	'user' => CRAFT_DB_USER,

	// The database password to connect with.
	'password' => CRAFT_DB_PASS,

	// The name of the database to select.
	'database' => CRAFT_DB_NAME,

	// The prefix to use when naming tables. This can be no more than 5 characters.
	'tablePrefix' => 'craft',

);
