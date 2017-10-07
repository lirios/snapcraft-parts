#!/bin/bash

# Launcher extension to workaround QtWebEngine
# crash with Nouveau graphic drivers by forcing
# Qt xcb software rendering:
# https://bugreports.qt.io/browse/QTBUG-41242

export QT_XCB_FORCE_SOFTWARE_OPENGL=1
