
using System.Runtime.Serialization;
using WPCordovaClassLib.Cordova;
using WPCordovaClassLib.Cordova.Commands;
using WPCordovaClassLib.Cordova.JSON;
using Microsoft.Phone.Shell;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Phone.Controls;
using System.Windows;
using FlurryWP8SDK;

using SimpleJSON;

namespace WPCordovaClassLib.Cordova.Commands
{
    public class FlurryPlugin : BaseCommand
    {
        public void setAppVersion(string options) {
            string version = getParams(options)[0];
            FlurryWP8SDK.Api.SetVersion(version);
        }

        public void startSession(string options) {
            string apiKey = getParams(options)[0];
            FlurryWP8SDK.Api.StartSession(apiKey);
        }

        public void setUserID(string options) {
            string userId = getParams(options)[0];
            FlurryWP8SDK.Api.SetUserId(userId);
        }

        public void setGender(string options) {
            string gender = getParams(options)[0];
            if (gender.Equals("male")) {
                FlurryWP8SDK.Api.SetGender(FlurryWP8SDK.Models.Gender.Male);
            } else
                if (gender.Equals("female")) {
                    FlurryWP8SDK.Api.SetGender(FlurryWP8SDK.Models.Gender.Female);
                }
                else {
                    FlurryWP8SDK.Api.SetGender(FlurryWP8SDK.Models.Gender.Unknown);
                }
        }

        // Should be removed name is incorrect, chaining to setlocation
        public void setLatitude(string options) {
            setLocation(options);
        }

        public void setLocation(string options) {
            string[] p = getParams(options);
            double latitude = double.Parse(p[0]);
            double longitude = double.Parse(p[1]);
            float accuracy = float.Parse(p[2]);
            FlurryWP8SDK.Api.SetLocation(latitude, longitude, accuracy);
        }

        public void setAge(string options) {
            int age = int.Parse(getParams(options)[0]);
            FlurryWP8SDK.Api.SetAge(age);
        }

        public void logEvent(string options) {
            string eventName = getParams(options)[0];
            FlurryWP8SDK.Api.LogEvent(eventName);
        }

        public void logEventWithParameters(string options) {
            string[] p = getParams(options);
            string eventName = p[0];
            FlurryWP8SDK.Api.LogEvent(eventName, jsonObjectToFlurryParameters(p[1]));
        }

        public void logTimedEvent(string options) {
            string eventName = getParams(options)[0];
            bool TIMED = true;
            FlurryWP8SDK.Api.LogEvent(eventName, TIMED);
        }

        public void logTimedEventWithParameters(string options) {
            string[] p = getParams(options);
            string eventName = p[0];
            bool TIMED = true;
            FlurryWP8SDK.Api.LogEvent(eventName, jsonObjectToFlurryParameters(p[1]), TIMED);
        }

        public void endTimedEvent(string options) {
            string eventName = getParams(options)[0];
            FlurryWP8SDK.Api.EndTimedEvent(eventName);
        }

        public void endTimedEventWithParameters(string options) {
            throw new NotImplementedException("logError has not been implemented for WP8");
        }

        public void setCrashReportingEnabled(string options) {
            // seems this is not available in the WP8 Flurry SDK
        }

        public void logPageView(string options) {
            FlurryWP8SDK.Api.LogPageView();
        }

        public void logError(string options) {
            throw new NotImplementedException("logError has not been implemented for WP8");
        }

        private static List<FlurryWP8SDK.Models.Parameter> jsonObjectToFlurryParameters(string s) {
            JObject parameters = JSONDecoder.Decode(s);

            List<FlurryWP8SDK.Models.Parameter> flurryParameters = new List<FlurryWP8SDK.Models.Parameter>();
            foreach (string key in parameters.ObjectValue.Keys) {
                flurryParameters.Add(new FlurryWP8SDK.Models.Parameter(key, (string) parameters[key]));                
            }
            return flurryParameters;
        }

        private static string[] getParams(string options) {
            return WPCordovaClassLib.Cordova.JSON.JsonHelper.Deserialize<string[]>(options);
        }

    }


}

