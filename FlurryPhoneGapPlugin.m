//
//  FlurryPhoneGapPlugin.m
//  Trailerpop
//
//  Created by John Potter on 11/21/12.
//
//

#import "FlurryPhoneGapPlugin.h"
#import "Flurry.h"

@interface FlurryPhoneGapPlugin()

@end

@implementation FlurryPhoneGapPlugin

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}


- (void) setAppVersion:(CDVInvokedUrlCommand*)command
{
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Setting Flurry version to %@", [command.arguments objectAtIndex:0]);
    
    @try {
        NSString* version = [command.arguments objectAtIndex:0];
        [Flurry setAppVersion: version];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
    
}

- (void) startSession:(CDVInvokedUrlCommand*)command
{
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Starting Flurry Session with key %@", [command.arguments objectAtIndex:0]);
    
    @try {
        NSString* key = [command.arguments objectAtIndex:0];
        // starting Flurry - Update Key before releasing
        [Flurry startSession: key];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
    
}

- (void) logEvent:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Event %@", [command.arguments objectAtIndex:0]);
    
    @try {
        NSString* event = [command.arguments objectAtIndex:0];
        
        [Flurry logEvent: event];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) logEventWithParameters:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Event %@", [command.arguments objectAtIndex:0]);
    NSLog(@"Event Parameters: %@", [command.arguments objectAtIndex:1]);
    
    @try {
        NSError *e = nil;
        NSString* event = [command.arguments objectAtIndex:0];
        NSData * data = [[command.arguments objectAtIndex:1] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* parameters = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        
        [Flurry logEvent:event withParameters:parameters];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) logTimedEvent:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Timed Event %@", [command.arguments objectAtIndex:0]);
    
    @try {
        NSString* event = [command.arguments objectAtIndex:0];
        bool Timed = [[command.arguments objectAtIndex:1]boolValue];
        
        [Flurry logEvent:event timed:Timed];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) endTimedEvent:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging End of Timed Event %@", [command.arguments objectAtIndex:0]);
    
    @try {
        NSString* event = [command.arguments objectAtIndex:0];
       
        [Flurry endTimedEvent:event withParameters:nil];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) logTimedEventWithParameters:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Event %@", [command.arguments objectAtIndex:0]);
    NSLog(@"Event Parameters: %@", [command.arguments objectAtIndex:1]);
    
    @try {
        NSError *e = nil;
        NSString* event = [command.arguments objectAtIndex:0];
        NSData * data = [[command.arguments objectAtIndex:1] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* parameters = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        bool Timed = [[command.arguments objectAtIndex:1]boolValue];
        
        [Flurry logEvent:event withParameters:parameters timed:Timed];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) endTimedEventWithParameters:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Ending Timed Event %@", [command.arguments objectAtIndex:0]);
    NSLog(@"Event Parameters: %@", [command.arguments objectAtIndex:1]);
    
    @try {
        NSError *e = nil;
        NSString* event = [command.arguments objectAtIndex:0];
        NSData * data = [[command.arguments objectAtIndex:1] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* parameters = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        
        [Flurry endTimedEvent:event withParameters:parameters];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setUserID:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Setting Flurry User ID to %@", [command.arguments objectAtIndex:0]);
    
    @try {
        NSString* userID = [command.arguments objectAtIndex:0];
        
        [Flurry setUserID: userID];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setGender:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Setting Flurry Gender to %@", [command.arguments objectAtIndex:0]);
    
    @try {
        NSString* Gender = [command.arguments objectAtIndex:0];
        
        [Flurry setGender: Gender];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setAge:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Setting Flurry Age to %@", [command.arguments objectAtIndex:0]);
    
    @try {
        int Age = [[command.arguments objectAtIndex:0]integerValue];
        
        [Flurry setAge: Age];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}


- (void) setShowErrorInLogEnabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Enabling Show Error in Flurry Event Logging");
    
    @try {
        bool Value = [[command.arguments objectAtIndex:0]boolValue];
        
        [Flurry setShowErrorInLogEnabled: Value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}


- (void) setEventLoggingEnabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Enabling Flurry Event Logging");
    
    @try {
        bool Value = [[command.arguments objectAtIndex:0]boolValue];
        
        [Flurry setEventLoggingEnabled: Value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setDebugLogEnabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Enabling Flurry Debug Logging");
    
    @try {
        bool Value = [[command.arguments objectAtIndex:0]boolValue];
        
        [Flurry setDebugLogEnabled: Value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setSecureTransportEnabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Enabling Flurry Secure Transport");
    
    @try {
        bool Value = [[command.arguments objectAtIndex:0]boolValue];
        
        [Flurry setSecureTransportEnabled: Value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setSessionReportsOnCloseEnabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Enabling Flurry Report On App Closing");
    
    @try {
        bool Value = [[command.arguments objectAtIndex:0]boolValue];
        
        [Flurry setSessionReportsOnCloseEnabled: Value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setSessionReportsOnPauseEnabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Enabling Flurry Report On App Pausing");
    
    @try {
        bool Value = [[command.arguments objectAtIndex:0]boolValue];
        
        [Flurry setSessionReportsOnPauseEnabled: Value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setSessionContinueSeconds:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
   NSLog(@"Setting Flurry Session Limit to %@", [command.arguments objectAtIndex:0]);
    
    @try {
        int Seconds = [[command.arguments objectAtIndex:0]integerValue];
        
        [Flurry setSessionContinueSeconds: Seconds];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}

- (void) setLatitude:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Reporting location to Flurry");
    
    @try {
        double Latitude   = [[command.arguments objectAtIndex:0]doubleValue];
        double Longitude  = [[command.arguments objectAtIndex:1]doubleValue];
        float  Horizontal = [[command.arguments objectAtIndex:2]floatValue];
        float  Vertical   = [[command.arguments objectAtIndex:3]floatValue];
        
        [Flurry setLatitude: Latitude longitude:Longitude horizontalAccuracy:Horizontal verticalAccuracy:Vertical ];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
}


@end
