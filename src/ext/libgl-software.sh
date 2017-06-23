#!/bin/bash

# Launcher extension to workaround QtWebEngine
# crash with Nouveau graphic drivers by forcing
# software rendering:
# https://bugreports.qt.io/browse/QTBUG-41242

export LIBGL_ALWAYS_SOFTWARE=1
