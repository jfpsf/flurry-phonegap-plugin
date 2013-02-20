flurry-phonegap-plugin
======================

UPDATE: 02/20/2013 - Updated to work with Flurry 4.1 and Cordova 2.4. Thanks Koraybalci

Phonegap plugin for Flurry mobile analytics

I've tested this plugin in PhoneGap 2.1 projects and it works fine. I've only included the methods that I've had a use for.
If you need any of the missing methods, please let me know, and I will look at adding them. Or, you can add them yourself, and submit the code.

You really need to be careful that you pass the correct values to the methods. In particular, all event parameters must be
in an NSDictionary that only contains strings, and remember that in Objective C booleans are Yes and No.

Here's how to install the plugin:

1. Register with Flurry and get an App key
2. Download the Flurry SDK and add the Flurry.h and libFlurry.a files to your PhoneGap project in XCode.
3. Add the FlurryPhoneGapPlugin.h and FlurryPhoneGapPlugin.m files to the Plugins directory of your project in XCode.
4. Add a key called "flurryPlugin" with the value "FlurryPhoneGapPlugin" to the Cordova.plist file
5. Include the flurryPlugin.js file in your main index file.
6. Call the startSession() method, with your app key, after the device is ready
7. Call the other Flurry methods as appropriate.
