#!/bin/bash

# Variables
platform_snap_name="liri-platform0"

# Version utilites

version_lte() {  # is version $1 lesser than or equal to $2
    [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
}

version_lt() {  # is version $1 lesser than $2
    [ "$1" = "$2" ] && return 1 || version_lte $1 $2
}

# Ensure that the Liri Platform is connected

if [ -d $SNAP/liri-platform ]; then
  RUNTIME=$SNAP/liri-platform
  if [ ! -d $RUNTIME/bin ] ; then
    echo "You need to connect this snap to the Liri Platform snap."
    echo ""
    echo "You can do this with those commands:"
    echo "snap install $platform_snap_name"
    echo "snap connect $SNAP_NAME:platform $platform_snap_name:platform"
    exit 1
  fi
fi

# Check for platform snap version

platform_version=$(exec $RUNTIME/bin/yaml r $RUNTIME/meta/snap.yaml version)
expected_version=$(exec $RUNTIME/bin/yaml r $SNAP/meta/snap.yaml plugs.platform.minimum-version)
if version_lt $platform_version $expected_version; then
    dialog_title="Liri Platform Update Required"
    dialog_message="This application requires a newer Liri Platform snap version ($expected_version). "
    dialog_message+="You have version $platform_version installed. "
    dialog_message+="Please update the Liri Platform snap package using your software "
    dialog_message+="store application or run the following command in a terminal:"
    dialog_code="snap refresh $platform_snap_name # use sudo if necessary"
    source $RUNTIME/bin/liri-app-launch $RUNTIME/bin/fluid-dialog "$dialog_title" "$dialog_message" --code "$dialog_code"
    exit 1
fi

# Source liri-app-launch to run the application

source $RUNTIME/bin/liri-app-launch "$@"

