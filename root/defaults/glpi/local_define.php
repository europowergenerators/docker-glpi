<?php
define('GLPI_VAR_DIR', '/config/glpi/files');
define('GLPI_LOG_DIR', '/config/log/glpi');
// ERROR;   GLPI plugins assume they are located _within_ the source framework! We cannot move the marketplace directory and/or symlink.
//          PHP FPM resolves symlinks to absolute paths, so relative includes (the plugins use this) will fail at runtime.
/* define('GLPI_MARKETPLACE_DIR', GLPI_ROOT . '/marketplace'); // DEFAULT */
