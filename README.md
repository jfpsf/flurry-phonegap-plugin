FlurryPlugin
============

## Usage

    cordova plugin add https://github.com/jfpsf/flurry-phonegap-plugin.git


### Installation
Unfortunately the policy of Flurry doesn't allow to include the SDK in this repository, so:

- you'll have to go to flurry.com
- create an account
- create iPhone AND Android applications to download the SDK files
- Follow the installation steps that come with the SDK files, Flurry has great documentation. Basically;
    - Android:
        - Copy `FlurryAgent-*.jar` lib to your lib dir manually.
        - Plugin automatically adds references to Google Play Services and Android v4 support lib.
        - If you already have `android-support-v4.jar` lib referenced in your project and get error messages, delete the new one in your libs folder.
    - iOS:
        - Copy `libFlurry_*.a` lib to your lib dir manually.
        - Plugin automatically adds references to Security and SystemConfiguration frameworks.
        - Verify that `libFlurry.a` is in the Build Phases/Link Binary with Libraries and the Frameworks `CFNetwork`, `Security` and `SystemConfiguration` frameworks are added.

### Integration
1. Call the startSession() method, with your app key, after the device is ready (from js).
2. Call the other Flurry plugin methods as appropriate (from js).
3. In Android, call flurry.endSession when the app is paused and again call flurry.startSession when the app resumes, or it won't log the session.
4. In iOS, setSessionReportsOnCloseEnabled and setSessionReportsOnPauseEnabled to log the session.


## Contributors

- [jfpsf](https://github.com/jfpsf)
- [Koray Balcı](https://github.com/koraybalci)
- [Patrick heneise (The Mobile Firm)](https://github.com/PatrickHeneise)
- [Ivan Karpan](https://github.com/IvanKarpan)

## License
Apache 2.0