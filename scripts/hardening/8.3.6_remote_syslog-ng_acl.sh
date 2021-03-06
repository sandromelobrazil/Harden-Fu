#!/bin/bash

#
# harbian audit 7/8/9  Hardening
#

#
# 8.3.6 Accept Remote rsyslog Messages Only on Designated Log Hosts (Not Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

HARDENING_LEVEL=3
PACKAGE_R='rsyslog'

# This function will be called if the script status is on enabled / audit mode
audit () {
    is_pkg_installed $PACKAGE_R
	if [ $FNRET = 0 ]; then
		ok "$PACKAGE_R has installed, so pass."
		FNRET=0
	else
    	info "Not implemented yet"
	fi
}

# This function will be called if the script status is on enabled mode
apply () {
    is_pkg_installed $PACKAGE_R
	if [ $FNRET = 0 ]; then
		ok "$PACKAGE_R has installed, so pass."
	else
    	info "Not implemented yet"
	fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
     echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
     echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r $CIS_ROOT_DIR/lib/main.sh ]; then
    . $CIS_ROOT_DIR/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi
