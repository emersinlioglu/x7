<?php
if (getenv('APPLICATION_ENV') == "development") {
    // HTTP
    define('HTTP_SERVER', 'http://x7.local/admin/');
    define('HTTP_CATALOG', 'http://x7.local/');

    // HTTPS
    define('HTTPS_SERVER', 'http://x7.local/admin/');
    define('HTTPS_CATALOG', 'http://x7.local/');

    // DIR
    define('DIR_APPLICATION', 'C:/www/x7/admin/');
    define('DIR_SYSTEM', 'C:/www/x7/system/');
    define('DIR_LANGUAGE', 'C:/www/x7/admin/language/');
    define('DIR_TEMPLATE', 'C:/www/x7/admin/view/template/');
    define('DIR_CONFIG', 'C:/www/x7/system/config/');
    define('DIR_IMAGE', 'C:/www/x7/image/');
    define('DIR_CACHE', 'C:/www/x7/system/storage/cache/');
    define('DIR_DOWNLOAD', 'C:/www/x7/system/storage/download/');
    define('DIR_LOGS', 'C:/www/x7/system/storage/logs/');
    define('DIR_MODIFICATION', 'C:/www/x7/system/storage/modification/');
    define('DIR_UPLOAD', 'C:/www/x7/system/storage/upload/');
    define('DIR_CATALOG', 'C:/www/x7/catalog/');

} else {
    // HTTP
    define('HTTP_SERVER', 'http://moreffect.de/X7/admin/');
    define('HTTP_CATALOG', 'http://moreffect.de/X7/');

    // HTTPS
    define('HTTPS_SERVER', 'http://moreffect.de/X7/admin/');
    define('HTTPS_CATALOG', 'http://moreffect.de/X7/');

    // DIR
    define('DIR_APPLICATION', '/var/www/vhosts/moreffect.de/httpdocs/X7/admin/');
    define('DIR_SYSTEM', '/var/www/vhosts/moreffect.de/httpdocs/X7/system/');
    define('DIR_LANGUAGE', '/var/www/vhosts/moreffect.de/httpdocs/X7/admin/language/');
    define('DIR_TEMPLATE', '/var/www/vhosts/moreffect.de/httpdocs/X7/admin/view/template/');
    define('DIR_CONFIG', '/var/www/vhosts/moreffect.de/httpdocs/X7/system/config/');
    define('DIR_IMAGE', '/var/www/vhosts/moreffect.de/httpdocs/X7/image/');
    define('DIR_CACHE', '/var/www/vhosts/moreffect.de/httpdocs/X7/system/storage/cache/');
    define('DIR_DOWNLOAD', '/var/www/vhosts/moreffect.de/httpdocs/X7/system/storage/download/');
    define('DIR_LOGS', '/var/www/vhosts/moreffect.de/httpdocs/X7/system/storage/logs/');
    define('DIR_MODIFICATION', '/var/www/vhosts/moreffect.de/httpdocs/X7/system/storage/modification/');
    define('DIR_UPLOAD', '/var/www/vhosts/moreffect.de/httpdocs/X7/system/storage/upload/');
    define('DIR_CATALOG', '/var/www/vhosts/moreffect.de/httpdocs/X7/catalog/');
}

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'x7shop');
define('DB_PASSWORD', 'Sicher4x7');
define('DB_DATABASE', 'x7shop');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');