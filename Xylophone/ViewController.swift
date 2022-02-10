import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyTapped(_ sender: UIButton) {
        
        sender.layer.opacity = 0.8
        
        if let letterOfKeyTapped = sender.titleLabel?.text {
            playSoundFile(name: letterOfKeyTapped)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
            UIView.animate(withDuration: 0.4) {
                sender.layer.opacity = 1.0
            }
        }
    }
    
    func playSoundFile(name: String) {
        if let url = Bundle.main.url(forResource: name, withExtension: "wav") {
            player = try? AVAudioPlayer(contentsOf: url)
            player.play()
        }
    }
    
}

