FlurryPlugin
============

Forked from https://github.com/jfpsf/flurry-phonegap-plugin and made a proper Cordova 3 plugin.

## Usage

    cordova plugin add https://github.com/PatrickHeneise/FlurryPlugin.git


### Get the SDK
Unfortunately the policy of Flurry doesn't allow to include the SDK in this repository, so you'll have to go to flurry.com, create an account and create an iPhone AND Android application to download the SDK files. Put them in `src/ios/libFlurry.a` and `src/android/FlurryAnalytics.jar`.


On iOS, verify that `libFlurry.a` is in the Build Phases/Link Binary with Libraries and the Frameworks `CFNetwork`, `Security` and `SystemConfiguration` frameworks are added.


1. Call the startSession() method, with your app key, after the device is ready
2. Call the other Flurry methods as appropriate.

## Contributors

- [jfpsf](https://github.com/jfpsf)
- [Koray Balcı](https://github.com/Koraybalci)

## License
Apache 2.0