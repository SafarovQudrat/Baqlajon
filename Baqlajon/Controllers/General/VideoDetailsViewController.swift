//
//  VideoDetailsVC.swift
//  Baqlajon
//
//  Created by  Abdurahmon on 09/02/23.
//

import UIKit
import AVKit
import AVFoundation

class VideoDetailsViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appColor(color: .background)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "meeting_01", ofType: "mp4")!))

        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
    }
    
}
