FlurryPlugin
============

## Usage

    cordova plugin add https://github.com/jfpsf/flurry-phonegap-plugin.git


### Get the SDK
Unfortunately the policy of Flurry doesn't allow to include the SDK in this repository, so:

- you'll have to go to flurry.com
- create an account
- create and iPhone AND Android application to download the SDK files
- Put them in `src/ios/libFlurry.a` and `src/android/FlurryAnalytics.jar`.


On iOS, verify that `libFlurry.a` is in the Build Phases/Link Binary with Libraries and the Frameworks `CFNetwork`, `Security` and `SystemConfiguration` frameworks are added.


1. Call the startSession() method, with your app key, after the device is ready
2. Call the other Flurry methods as appropriate.
3. In Android, call flurry.endSession when the app is paused and again call flurry.startSession when the app resumes, or it won't log the session.
4. In IOS, setSessionReportsOnCloseEnabled and setSessionReportsOnPauseEnabled to log the session.


## Contributors

- [jfpsf](https://github.com/jfpsf)
- [Koray Balcı](https://github.com/Koraybalci)
- [Patrick heneise (The Mobile Firm)](https://github.com/PatrickHeneise)
- [Ivan Karpan](https://github.com/IvanKarpan)

## License
Apache 2.0
