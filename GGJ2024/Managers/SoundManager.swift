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
        case ploc
        case background
        case botao1Menu
        case botao2Menu
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
    
    func playLoop(sound: SoundOption, volume: Float, loops: Int = 0) {
           guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }

           do {
               background = try AVAudioPlayer(contentsOf: url)
               background?.numberOfLoops = loops
               background?.volume = volume
               background?.prepareToPlay()
               background?.play()
           } catch let error {
               print("Error playing sound. (error.localizedDescription)")
           }
       }
    
    func stopSound(sound: SoundOption) {
           switch sound {
           case .background:
               background?.stop()
           case .FrutaCerta, .FrutaErrada, .ploc, .botao1Menu, .botao2Menu:
               player?.stop()
           }
       }
}
