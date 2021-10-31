import Foundation
import Capacitor

@objc(ShazamPlugin)
public class ShazamPlugin: CAPPlugin {

    private let implementation = Shazam()

    @objc func startMatch(_ call: CAPPluginCall) {
        // let value = call.getString("value") ?? ""
        implementation.startMatch()
        call.resolve()
    }

    @objc func stopMatch(_ call: CAPPluginCall) {
        implementation.stopMatch()
        call.resolve()
    }
}
