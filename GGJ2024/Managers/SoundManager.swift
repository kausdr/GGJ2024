import Foundation
import AVFoundation
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    var background: AVAudioPlayer?
    
    enum SoundOption: String {
        case FrutaCerta
        case FrutaErrada
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
//            player?.volume = volume
            
        } catch let error {
            print("Error playing sound. (error.localizedDescription)")
        }
    }
}
