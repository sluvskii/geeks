import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.blue, for: .normal)
        playButton.addTarget(self, action: #selector(playMusic), for: .touchUpInside)

        playButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)

        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc func playMusic() {
        guard let url = Bundle.main.url(forResource: "sample", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing audio: \(error)")
        }
    }
}
