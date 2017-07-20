#!/bin/sh
####################################################################################################
#
# GitRepo: https://github.com/macmule/Dockutil-Add-App
#
# License: https://macmule.com/license/
#
####################################################################################################

###
# Get the Username of the logged in user
###
loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

echo "$loggedInUser..."

# HARDCODED VALUES ARE SET HERE

# Applications Path, specify full path as in: /Applications/Safari.app
appPath=""

# CHECK TO SEE IF A VALUE WAS PASSED IN PARAMETER 4 AND, IF SO, ASSIGN TO "appPath"
if [ "$4" != "" ] && [ "$appPath" == "" ];then
    appPath=$4
fi

##
# Error if variable appPath is empty
##
if [ "$appPath" == "" ]; then
	echo "Error:  No value was specified for the appPath variable..."
	exit 1
fi

###
# Add the App as given at $appPath
###

echo "Will add "$appPath"..."

sudo -u "$loggedInUser" /usr/local/bin/dockutil --add "$appPath" /Users/"$loggedInUser"

echo "Added "$appPath" to /Users/"$loggedInUser"..."
