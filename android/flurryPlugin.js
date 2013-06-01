// Flurry Phonegap Plugin Android Version by cc

var Flurry = function() {
    
};

// These functions must be called before you start the Flurry session

Flurry.prototype.setAppVersion = function(version,successCallback,failureCallback) {
    return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'setAppVersion', [version]);
}

// End of functions that must be called before Flurry session starts

// key is a string
Flurry.prototype.startSession = function(key,successCallback,failureCallback) {
    return cordova.exec(successCallback, failureCallback, 'FlurryPlugin', 'startSession', [key]);
}

// event must be a string
Flurry.prototype.logEvent = function(event, successCallback, failureCallback) {
  return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logEvent', [event]);
};

// parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471", location: "New York"}
Flurry.prototype.logEventWithParameters = function(event, parameters, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logEventWithParameters', [event, parameters]);
};

// timed must be Yes or No, to be compatible with objC part
Flurry.prototype.logTimedEvent = function(event, timed, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logTimedEvent', [event, timed]);
};

// parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471", location: "New York"}
// timed must be Yes or No, to be compatible with objC part
Flurry.prototype.logTimedEventWithParameters = function(event, parameters, timed, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'logTimedEventWithParameters', [event, parameters, timed]);
};

Flurry.prototype.endTimedEvent = function(event, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'endTimedEvent', [event]);
};

// parameters must be a JSON dictionary that contains only strings like {id:"4", price: "471", location: "New York"}
// only used if you want to override the original parameters
Flurry.prototype.endTimedEventWithParameters = function(event, parameters, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'endTimedEventWithParameters', [event, parameters]);
};

// userID must be a string
Flurry.prototype.setUserID = function(userID, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setUserID', [userID]);
}

// gender must be a 0 for female, 1 for male and -1 for unknown
Flurry.prototype.setGender = function(gender, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setGender', [gender]);
}

// age must be an integer
Flurry.prototype.setAge = function(age, successCallback, failureCallback) {
    return cordova.exec( successCallback, failureCallback, 'FlurryPlugin', 'setAge', [age]);
}

flurry = new Flurry();

