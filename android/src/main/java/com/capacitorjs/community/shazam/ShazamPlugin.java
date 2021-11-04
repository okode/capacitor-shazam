package com.capacitorjs.community.shazam;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "Shazam")
public class ShazamPlugin extends Plugin {

    private Shazam implementation = new Shazam();

    @PluginMethod
    public void startMatch(PluginCall call) {
        implementation.startMatch();
        call.resolve();
    }

    @PluginMethod
    public void stopMatch(PluginCall call) {
        implementation.stopMatch();
        call.resolve();
    }

    @PluginMethod
    public void createCalendarEvent(PluginCall call) {
        call.resolve();
    }

}
