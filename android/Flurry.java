package com.phonegap.plugins.flurry;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import android.util.Log;

import com.flurry.android.FlurryAgent;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Flurry extends CordovaPlugin {

    private Map<String, String> JsonToMap(JSONObject jdata) throws JSONException {
        if(jdata == null){
            Log.d("Flurry", "not a json");
            return null;
        }
        @SuppressWarnings ("unchecked")
        Iterator<String> nameItr = jdata.keys();
        Map<String, String> params = new HashMap<String, String>();
        while(nameItr.hasNext()) {
            String name = nameItr.next();
            params.put(name, jdata.getString(name));
        }
        return params;
    }
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try{
            Log.d("Flurry", action);
            if(action.equals("startSession")) {
                FlurryAgent.onStartSession(cordova.getActivity().getApplicationContext(), args.getString(0));
            } else if(action.equals("setAppVersion")) {
                FlurryAgent.setVersionName(args.getString(0));
            } else if(action.equals("setUserID")) {
                FlurryAgent.setUserId(args.getString(0));
            } else if(action.equals("setGender")) {
                FlurryAgent.setGender((byte)args.getLong(0));
            } else if(action.equals("setAge")) {                
                FlurryAgent.setAge((int)args.getLong(0));
            } else if (action.equals("logEvent") || action.equals("logEventWithParameters")
                    || action.equals("logTimedEvent") || action.equals("logTimedEventWithParameters")) {
                boolean timed = false;
                if(args.optString(2).equalsIgnoreCase("Yes")) timed = true;
                this.logEvent(args.getString(0), args.optJSONObject(1), timed);                
            } else if(action.equals("endTimedEvent")) {
                FlurryAgent.endTimedEvent(args.getString(0));
            } else if(action.equals("endTimedEventWithParameters")) {
                Map<String, String> params = this.JsonToMap(args.optJSONObject(1));
                if(params != null)
                    FlurryAgent.endTimedEvent(args.getString(0), params);
            }
            else if (action.equals("setCrashReportingEnabled")) {
                FlurryAgent.setCaptureUncaughtExceptions(args.optString(0).equalsIgnoreCase("Yes"));
            }
            else if (action.equals("logPageView")) {
                FlurryAgent.onPageView();
            }
            else if (action.equals("logError")) {
                FlurryAgent.onError(args.getString(0), args.getString(1), " ");
            }
            else {
                Log.d("Flurry", "invalid/na flurry method: " + action);
                callbackContext.error("invalid/na flurry method: " + action);
                return false;
            }
            callbackContext.success("");
            return true; 
        } catch (JSONException e){
            Log.d("Flurry exception: ", e.getMessage());
            callbackContext.error("flurry json exception: " + e.getMessage());
            return false;
        }
    }
    
    private void logEvent(String eventName, JSONObject options, boolean timed)  throws JSONException {
        if(options != null){
            Map<String, String> params = this.JsonToMap(options);
            if(params != null)
                FlurryAgent.logEvent(eventName, params, timed);
        }else{
            FlurryAgent.logEvent(eventName, timed);
        }
    }   
}
