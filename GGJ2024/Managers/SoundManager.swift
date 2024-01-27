import Foundation
import AVKit

class SoundManager{
    static let instance = SoundManager()
    
    var player:AVAudioPlayer?
    
    func playSound(sound:SoundOptions){
        print("aceito")
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        do{
            print("xxx")
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("Error: \(error.localizedDescription)")
        }
        
    }
}

enum SoundOptions:String,CaseIterable{
    case pruu
    case genericsound
}
