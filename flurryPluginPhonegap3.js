  var exec = require('cordova/exec');

  var flurry = {};


  flurry.setAppVersion = function(version,successCallback,failureCallback) {
    exec(successCallback, failureCallback, 'FlurryPlugin', 'setAppVersion', [version]);
  };

  // argument must be Yes or No, because it's objective C
  flurry.setShowErrorInLogEnabled = function(enableValue, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setShowErrorInLogEnabled', [enableValue]);
  };

  // argument must be Yes or No, because it's objective C
  flurry.setEventLoggingEnabled = function(enableValue, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setEventLoggingEnabled', [enableValue]);
  };

  // argument must be Yes or No, because it's objective C
  flurry.setDebugLogEnabled = function(enableValue, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setDebugLogEnabled', [enableValue]);
  };

  // argument must be Yes or No, because it's objective C
  flurry.setSecureTransportEnabled = function(enableValue, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setSecureTransportEnabled', [enableValue]);
  };

  // seconds must be an integer
  flurry.setSessionContinueSeconds = function(seconds, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setSessionContinueSeconds', [seconds]);
  };

  // argument must be Yes or No, because it's objective C
  flurry.setCrashReportingEnabled = function(enableValue, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setCrashReportingEnabled', [enableValue]);
  };

  // End of functions that must be called before Flurry session starts

  // key is a string
  flurry.startSession = function(key,successCallback,failureCallback) {
    exec(successCallback, failureCallback, 'FlurryPlugin', 'startSession', [key]);
  };

  // event must be a string
  flurry.logEvent = function(event, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'logEvent', [event]);
  };

  // parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471", location: "New York"}
  flurry.logEventWithParameters = function(event, parameters, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'logEventWithParameters', [event, parameters]);
  };

  flurry.logPageView = function(successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'logPageView', []);
  };

  // timed must be Yes or No, because it's objective C
  flurry.logTimedEvent = function(event, timed, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'logTimedEvent', [event, timed]);
  };

  // parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471", location: "New York"}
  // timed must be Yes or No, because it's objective C
  flurry.logTimedEventWithParameters = function(event, parameters, timed, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'logTimedEventWithParameters', [event, parameters, timed]);
  };

  flurry.endTimedEvent = function(event, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'endTimedEvent', [event]);
  };

  // parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471", location: "New York"}
  // only used if you want to override the original parameters
  flurry.endTimedEventWithParameters = function(event, parameters, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'endTimedEventWithParameters', [event, parameters]);
  };

  // userID must be a string
  flurry.setUserID = function(userID, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setUserID', [userID]);
  };

  // gender must be a string. male and female are acceptable values
  flurry.setGender = function(gender, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setGender', [gender]);
  };

  // age must be an integer
  flurry.setAge = function(age, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setAge', [age]);
  };

  // latitude and longitude must be doubles; horizontal and vertical accuracy must be float
  // TODO should be removed named incorrectly (setLocation), retained for backward compatibility
  flurry.setLatitude = function (latitude, longitude, horizontalAccuracy, verticalAccuracy, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'setLatitude', [latitude,longitude,horizontalAccuracy,verticalAccuracy]);
  };

  // latitude and longitude must be doubles; horizontal and vertical accuracy must be float
  flurry.setLocation = function (latitude, longitude, horizontalAccuracy, verticalAccuracy, successCallback, failureCallback) {
      exec(successCallback, failureCallback, 'FlurryPlugin', 'setLocation', [latitude, longitude, horizontalAccuracy, verticalAccuracy]);
  };
    
  // argument must be Yes or No, because it's objective C
  flurry.setSessionReportsOnCloseEnabled = function (enabled, successCallback, failureCallback) {
    exec(successCallback, failureCallback, 'FlurryPlugin', 'setSessionReportsOnCloseEnabled', [enabled]);
  };

  // argument must be Yes or No, because it's objective C
  flurry.setSessionReportsOnPauseEnabled = function (enabled, successCallback, failureCallback) {
    exec(successCallback, failureCallback, 'FlurryPlugin', 'setSessionReportsOnPauseEnabled', [enabled]);
  };

  flurry.logError = function(errorID, message, successCallback, failureCallback) {
    exec( successCallback, failureCallback, 'FlurryPlugin', 'logError', [errorID, message]);
  };


  module.exports = flurry;