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
# Build a docker image for an Easy!Appointments release.
#
# This script will create a new local Docker image for a tagged Easy!Appointments release, that has a zip package file
# attached to it on Github (see https://github.com/alextselegidis/easyappointments/releases).
#
# Usage:
#
#  ./build.sh <version>
#
# Example:
#
#   ./build.sh 1.4.3
#

DEFAULT_VERSION=1.4.3

VERSION="${1:-$DEFAULT_VERSION}"

docker build --tag easyappointments:${VERSION} --build-arg VERSION=${VERSION} .
