<?php

if (getenv('APPLICATION_ENV') == "development") {
    // HTTP
    define('HTTP_SERVER', 'http://x7.local/');

    // HTTPS
    define('HTTPS_SERVER', 'http://x7.local/');

    // DIR
    define('DIR_APPLICATION', 'C:/www/x7/catalog/');
    define('DIR_SYSTEM', 'C:/www/x7/system/');
    define('DIR_LANGUAGE', 'C:/www/x7/catalog/language/');
    define('DIR_TEMPLATE', 'C:/www/x7/catalog/view/theme/');
    define('DIR_CONFIG', 'C:/www/x7/system/config/');
    define('DIR_IMAGE', 'C:/www/x7/image/');
    define('DIR_CACHE', 'C:/www/x7/system/storage/cache/');
    define('DIR_DOWNLOAD', 'C:/www/x7/system/storage/download/');
    define('DIR_LOGS', 'C:/www/x7/system/storage/logs/');
    define('DIR_MODIFICATION', 'C:/www/x7/system/storage/modification/');
    define('DIR_UPLOAD', 'C:/www/x7/system/storage/upload/');

    // DB
    define('DB_DRIVER', 'mysqli');
    define('DB_HOSTNAME', 'localhost');
    define('DB_USERNAME', 'x7shop');
    define('DB_PASSWORD', 'Sicher4x7');
    define('DB_DATABASE', 'x7shop');
    define('DB_PORT', '3306');
    define('DB_PREFIX', 'oc_');
} else {
    // HTTP
    define('HTTP_SERVER', 'http://moreffect.de/X7/');

    // HTTPS
    define('HTTPS_SERVER', 'http://moreffect.de/X7/');

    // DIR
    define('DIR_APPLICATION', 'C:/www/x7/catalog/');
    define('DIR_SYSTEM', 'C:/www/x7/system/');
    define('DIR_LANGUAGE', 'C:/www/x7/catalog/language/');
    define('DIR_TEMPLATE', 'C:/www/x7/catalog/view/theme/');
    define('DIR_CONFIG', 'C:/www/x7/system/config/');
    define('DIR_IMAGE', 'C:/www/x7/image/');
    define('DIR_CACHE', 'C:/www/x7/system/storage/cache/');
    define('DIR_DOWNLOAD', 'C:/www/x7/system/storage/download/');
    define('DIR_LOGS', 'C:/www/x7/system/storage/logs/');
    define('DIR_MODIFICATION', 'C:/www/x7/system/storage/modification/');
    define('DIR_UPLOAD', 'C:/www/x7/system/storage/upload/');

    // DB
    define('DB_DRIVER', 'mysqli');
    define('DB_HOSTNAME', 'localhost');
    define('DB_USERNAME', 'x7shop');
    define('DB_PASSWORD', 'Sicher4x7');
    define('DB_DATABASE', 'x7shop');
    define('DB_PORT', '3306');
    define('DB_PREFIX', 'oc_');
}
