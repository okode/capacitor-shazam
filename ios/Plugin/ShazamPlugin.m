#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(ShazamPlugin, "Shazam",
           CAP_PLUGIN_METHOD(startMatch, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(stopMatch, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(createCalendarEvent, CAPPluginReturnNone);
)
