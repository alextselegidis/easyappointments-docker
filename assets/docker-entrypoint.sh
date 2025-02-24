#!/bin/bash

# -----------------------------------------------------------------------------
# Easy!Appointments - Online Appointment Scheduler
#
# @package     EasyAppointments
# @author      A.Tselegidis <alextselegidis@gmail.com>
# @copyright   Copyright (c) Alex Tselegidis
# @license     https://opensource.org/licenses/GPL-3.0 - GPLv3
# @link        https://easyappointments.org
# -----------------------------------------------------------------------------

##
# Set up the currently cloned Easy!Appointments build.
#
# This script will perform the required actions so that Easy!Appointments is configured properly to work with the
# provided environment variables.
#
# Usage:
#
#  ./docker-entrypoint.sh
#

# Config

cp config-sample.php config.php

sed -i "s|const BASE_URL = 'http://localhost';|const BASE_URL = '$BASE_URL';|g" config.php
sed -i "s|const LANGUAGE = 'english';|const LANGUAGE = '$LANGUAGE';|g" config.php
sed -i "s|const DEBUG_MODE = false;|const DEBUG_MODE = $DEBUG_MODE;|g" config.php

sed -i "s|const DB_HOST = 'mysql';|const DB_HOST = '$DB_HOST';|g" config.php
sed -i "s|const DB_NAME = 'easyappointments';|const DB_NAME = '$DB_NAME';|g" config.php
sed -i "s|const DB_USERNAME = 'user';|const DB_USERNAME = '$DB_USERNAME';|g" config.php
sed -i "s|const DB_PASSWORD = 'password';|const DB_PASSWORD = '$DB_PASSWORD';|g" config.php

sed -i "s|const GOOGLE_SYNC_FEATURE = false;|const GOOGLE_SYNC_FEATURE = '$GOOGLE_SYNC_FEATURE';|g" config.php
sed -i "s|const GOOGLE_PRODUCT_NAME = '';|const GOOGLE_PRODUCT_NAME = '$GOOGLE_GOOGLE_PRODUCT_NAME';|g" config.php
sed -i "s|const GOOGLE_CLIENT_ID = '';|const GOOGLE_CLIENT_ID = '$GOOGLE_CLIENT_ID';|g" config.php
sed -i "s|const GOOGLE_CLIENT_SECRET = '';|const GOOGLE_CLIENT_SECRET = '$GOOGLE_CLIENT_SECRET';|g" config.php
sed -i "s|const GOOGLE_API_KEY = '';|const GOOGLE_API_KEY = '$GOOGLE_API_KEY';|g" config.php

# SMTP

cat <<EOF >/etc/ssmtp/ssmtp.conf
root=${SMTP_FROM_ADDRESS}
mailhub=${SMTP_HOST}:${SMTP_PORT}
AuthUser=${SMTP_USERNAME}
AuthPass=${SMTP_PASSWORD}
UseTLS=${SMTP_TLS}
UseSTARTTLS=${SMTP_TLS}
FromLineOverride=YES
EOF

cat <<EOF >/var/www/html/application/config/email.php
<?php defined('BASEPATH') or exit('No direct script access allowed');

// Add custom values by settings them to the $config array.
// Example: $config['smtp_host'] = 'smtp.gmail.com';
// @link https://codeigniter.com/user_guide/libraries/email.html

\$config['useragent'] = 'Easy!Appointments';
\$config['protocol'] = 'mail'; // or 'smtp'
\$config['mailtype'] = 'html'; // or 'text'
\$config['smtp_debug'] = '0'; // or '1'
\$config['smtp_auth'] = ${SMTP_AUTH}; //or FALSE for anonymous relay.
\$config['smtp_host'] = '${SMTP_HOST}';
\$config['smtp_user'] = '${SMTP_USERNAME}';
\$config['smtp_pass'] = '${SMTP_PASSWORD}';
\$config['smtp_crypto'] = '${SMTP_PROTOCOL}'; // or 'tls'
\$config['smtp_port'] = ${SMTP_PORT};
\$config['from_name'] = '${SMTP_FROM_NAME}';
\$config['from_address'] = '${SMTP_FROM_ADDRESS}';
\$config['reply_to'] = '${SMTP_REPLY_TO_ADDRESS}';
\$config['crlf'] = "\r\n";
\$config['newline'] = "\r\n";
EOF


apache2-foreground
