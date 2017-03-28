## Snapcraft Cloud Part
Snapcraft cloud part for apps using the [Liri Platform snap](https://github.com/lirios/platform-snap)

### Usage

In your `snapcraft.yaml`, add the `liri-app` part to the list of `after` parts.
You can then use the `liri-app-launch-command` to run your application with
the Liri Platform snap.
```yaml
apps:
  app:
    # ...
    command: liri-app-launch $SNAP/bin/app
parts:
  app:
    # ...
    after: [liri-app]
```
