import Foundation
import ShazamKit

@objc public class Shazam: NSObject, SHSessionDelegate {
    
    let session = SHSession()
    let audioEngine = AVAudioEngine()
    var lastMatchID = ""
        
    func startMatch() {
        session.delegate = self
        let inputNode = audioEngine.inputNode
        let bus = 0
        inputNode.installTap(onBus: bus, bufferSize: 2048, format: inputNode.inputFormat(forBus: bus)) { (buffer: AVAudioPCMBuffer!, time: AVAudioTime!) -> Void in
            self.session.matchStreamingBuffer(buffer, at: time)
        }
        
        audioEngine.prepare()
        try! audioEngine.start()
    }
    
    func stopMatch() {
        let inputNode = audioEngine.inputNode
        let bus = 0
        inputNode.removeTap(onBus: bus)
        self.audioEngine.stop()
    }
    
    public func session(_ session: SHSession, didFind match: SHMatch) {
        if let matchedItem = match.mediaItems.first,
           let title = matchedItem.title,
           let artist = matchedItem.artist,
           let matchId = matchedItem.shazamID, matchId != lastMatchID {
            lastMatchID = matchId
            print("I am currently listening to: \(title) by \(artist) - Via ShazamKit")
        }
    }
    
    public func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        if error != nil {
            print(error as Any)
        }
    }
}
