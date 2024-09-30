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

apache2-foreground
