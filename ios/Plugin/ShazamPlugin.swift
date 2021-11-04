import Foundation
import Capacitor
import ShazamKit
import EventKit
import EventKitUI

@available(iOS 15.0, *)
@objc(ShazamPlugin)
public class ShazamPlugin: CAPPlugin, SHSessionDelegate, EKEventEditViewDelegate {
    
    let session = SHSession()
    let audioEngine = AVAudioEngine()
    var lastMatchID = ""
    let eventStore = EKEventStore()
    let eventController = EKEventEditViewController()

    @objc func startMatch(_ call: CAPPluginCall) {
        startMatchImpl()
        call.resolve()
    }

    @objc func stopMatch(_ call: CAPPluginCall) {
        stopMatchImpl()
        call.resolve()
    }

    @objc func createCalendarEvent(_ call: CAPPluginCall) {
        eventStore.requestAccess( to: EKEntityType.event, completion:{(granted, error) in
            DispatchQueue.main.async {
                if (granted) && (error == nil) {
                    let event = EKEvent(eventStore: self.eventStore)
                    let iso8601Formatter = ISO8601DateFormatter()
                    event.title = call.getString("title")
                    event.location = call.getString("location")
                    event.notes = call.getString("notes")
                    event.startDate = iso8601Formatter.date(from: call.getString("startDate", ""))
                    event.endDate = iso8601Formatter.date(from: call.getString("endDate", ""))
                    self.eventController.event = event
                    self.eventController.eventStore = self.eventStore
                    self.eventController.editViewDelegate = self
                    DispatchQueue.main.async {
                        self.bridge?.viewController?.present(self.eventController, animated: true, completion: nil)
                    }
                }
            }
        })
        call.resolve()
    }
    
    public func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        self.eventController.dismiss(animated: true, completion: nil)
    }
    
    func startMatchImpl() {
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
           let appleMusicURL = matchedItem.appleMusicURL,
           let artworkURL = matchedItem.artworkURL,
           let subtitle = matchedItem.subtitle,
           let webURL = matchedItem.webURL,
           let releaseDate = matchedItem.songs[0].releaseDate,
           let albumTitle = matchedItem.songs[0].albumTitle,
           let matchId = matchedItem.shazamID, matchId != lastMatchID {
            lastMatchID = matchId
            var data = [String: String]()
            data["title"] = title
            data["artist"] = artist
            data["appleMusicURL"] = appleMusicURL.absoluteString
            data["artworkURL"] = artworkURL.absoluteString
            data["subtitle"] = subtitle
            data["webURL"] = webURL.absoluteString
            data["releaseDate"] = releaseDate.ISO8601Format()
            data["albumTitle"] = albumTitle
            self.notifyListeners("didFind", data: data)
        }
    }
    
    public func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        self.notifyListeners("didNotFindMatchFor", data: [String: Any]())
    }
    
}
