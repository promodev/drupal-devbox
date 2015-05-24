<?php

define('LIVE_DOMAIN', 'example.com');
define('LIVE_HOST', 'example.com');

if (!function_exists('_drush_generate_alias')) {
  function _drush_generate_alias($key) {
    return [
      $key . '-dev' => [
        'uri' => $key . '.drupal.dev',
        'root' => '/srv/www/' . $key,
      ],
      $key . '-live' => [
        'uri' => $key . '.' . LIVE_DOMAIN,
        'root' => '/srv/www/' . $key,
        'remote-host' => LIVE_HOST,
        'ssh-options' => '-p PORT',
      ],
    ];
  }
}

$aliases = [] +
_drush_generate_alias('d7');
