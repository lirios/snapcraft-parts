#!/bin/bash

# Variables
platform_snap_name=$(cat $SNAP/meta/platform)

snap_root_path=$(realpath $SNAP/../../)

# Ensure that the Liri Platform is connected

if [ -n "$SNAP_IS_CLASSIC" ]; then
    if [ -d $snap_root_path/$platform_snap_name ]; then
        RUNTIME=$snap_root_path/$platform_snap_name/current
    else
        echo "You need to install the Liri Platform snap."
        echo ""
        echo "You can do this with those commands:"
        echo "snap install $platform_snap_name"
        exit 1
    fi
else
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
fi

# Export RUNTIME and run the platform snap launcher

export RUNTIME
exec $RUNTIME/bin/liri-app-launch "$@"
