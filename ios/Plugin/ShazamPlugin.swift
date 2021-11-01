import Foundation
import Capacitor
import ShazamKit

@objc(ShazamPlugin)
public class ShazamPlugin: CAPPlugin, SHSessionDelegate {

    let session = SHSession()
    let audioEngine = AVAudioEngine()
    var lastMatchID = ""

    @objc func startMatch(_ call: CAPPluginCall) {
        startMatchImpl()
        call.resolve()
    }

    @objc func stopMatch(_ call: CAPPluginCall) {
        stopMatchImpl()
        call.resolve()
    }
    
    func startMatchImpl() {
        print("startMatchImpl")
        session.delegate = self
        let inputNode = audioEngine.inputNode
        let bus = 0
        inputNode.installTap(onBus: bus, bufferSize: 2048, format: inputNode.inputFormat(forBus: bus)) { (buffer: AVAudioPCMBuffer!, time: AVAudioTime!) -> Void in
            self.session.matchStreamingBuffer(buffer, at: time)
        }
        
        audioEngine.prepare()
        try! audioEngine.start()
    }
    
    func stopMatchImpl() {
        print("stopMatchImpl")
        let inputNode = audioEngine.inputNode
        let bus = 0
        inputNode.removeTap(onBus: bus)
        self.audioEngine.stop()
        self.lastMatchID = ""
    }
    
    public func session(_ session: SHSession, didFind match: SHMatch) {
        if let matchedItem = match.mediaItems.first,
           let title = matchedItem.title,
           let artist = matchedItem.artist,
           let matchId = matchedItem.shazamID, matchId != lastMatchID {
            lastMatchID = matchId
            print("didFind: \(title) by \(artist)")
            var data = [String: String]()
            data["title"] = title
            data["artist"] = artist
            print("notifyListeners with event didFind")
            self.notifyListeners("didFind", data: data)
        }
    }
    
    public func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        print("notifyListeners with event didNotFindMatchFor")
        self.notifyListeners("didNotFindMatchFor", data: [String: Any]())
    }
    
}
