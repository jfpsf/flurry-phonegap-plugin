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
		- Change the name of `FlurryAgent-*.jar` (or `FlurryAnalytics-*.jar` if using uptodate version) to `FlurryAgent.jar`
        - Copy `FlurryAgent.jar` into the 'plugin/com.phonegap.plugins.Flurry/src/android' folder
        - Plugin automatically adds references to Google Play Services and Android v4 support lib.
        - If you do not have `android-support-vX.jar` lib referenced in your project and get error messages, install it by following instructions at http://developer.android.com/tools/support-library/features.html#v4.
    - iOS:
		- Change the name of `libFlurry_*.a` to `libFlurry.a`
        - Copy `libFlurry.a` into the 'plugin/com.phonegap.plugins.Flurry/src/ios' folder.
        - Plugin automatically adds references to Security and SystemConfiguration frameworks.
        - Verify that `libFlurry.a` is in the Build Phases/Link Binary with Libraries and the Frameworks `CFNetwork`, `Security` and `SystemConfiguration` frameworks are added.

### Integration
1. Call the startSession() method, with your app key, after the device is ready (from js).
2. Call the other Flurry plugin methods as appropriate (from js).
3. In Android, call flurry.endSession when the app is paused and again call flurry.startSession when the app resumes, or it won't log the session.
4. In iOS, setSessionReportsOnCloseEnabled and setSessionReportsOnPauseEnabled to log the session.

## Example is 

===================================================================================================================================================

			self.log('Flurry Analytics Init');
            if (window.plugins && window.plugins.flurry) {
                var ua = navigator.userAgent.toLowerCase();
                var isAndroid = ua.indexOf("android") > -1; //&& ua.indexOf("mobile");
                if (isAndroid) {
                    window.plugins.flurry.startSession('Your API Key', function () {
                        console.log('Flurry Success!');
                    }, function () {
                        alert('Flurry Error!');
                    });
                } else {
                    window.plugins.flurry.startSession('Your API Key', function () {
                        console.log('Flurry Success!');
                        window.plugins.flurry.setSessionReportsOnCloseEnabled(true); // iOS only
                        window.plugins.flurry.setSessionReportsOnPauseEnabled(true); // iOS only
                    }, function () {
                        alert('Flurry Error!');
                    });
                }
            }

===================================================================================================================================================

## Contributors

- [jfpsf](https://github.com/jfpsf)
- [Koray Balcı](https://github.com/koraybalci)
- [Patrick heneise (The Mobile Firm)](https://github.com/PatrickHeneise)
- [Ivan Karpan](https://github.com/IvanKarpan)
- [LilDevine89](https://github.com/LilDevine89)

## License
Apache 2.0
