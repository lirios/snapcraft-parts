## Snapcraft Cloud Parts
Snapcraft cloud parts for snaps using the [Liri Platform snap](https://github.com/lirios/platform-snap)

### Usage

#### Liri Platform

The Liri Platform cloud parts make it a lot easier to launch snap applications
depending on the Liri Platform snap.

In your `snapcraft.yaml`, add the `liri-platform-<version>` part to the list of
`after` parts.
You can then use the `liri-app-launch` command to run your application with
the Liri Platform snap.
```yaml
apps:
  app:
    # ...
    command: liri-app-launch $SNAP/bin/app
parts:
  app:
    # ...
    after: [liri-platform-<version>]
```

Available versions:
  * `liri-platform-v0.10.0`

#### Extensions

In addition to the main Liri Platform cloud parts, the launch behaivor
can be customized using the following extension parts:

* `liri-platform-ext-qt-xcb-software`: Launcher extension to workaround
[QtWebEngine crash with Nouveau graphic drivers](https://bugreports.qt.io/browse/QTBUG-41242)
 by forcing the xcb QPA platform plugin to use software rendering of.
* `liri-platform-ext-snap-classic`: Launcher extension to make classic snaps
launch properly.
