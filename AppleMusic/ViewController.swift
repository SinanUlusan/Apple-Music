//
//  ViewController.swift
//  AppleMusic
//
//  Created by Sinan Ulusan on 23.08.2020.
//  Copyright © 2020 Sinan Ulusan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UIElements
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var reverseBackgroundView: UIView!
    @IBOutlet var playPauseBackgroundView: UIView!
    @IBOutlet var forwardBackgroundView: UIView!
    
    @IBOutlet var reverseButton: UIButton!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    
    // MARK: -Properties
    var isPlaying: Bool = true {
        didSet{
            if isPlaying{
                playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
            }else{
                playPauseButton.setImage(UIImage(named: "play"), for: .normal)
            }
        }
    }
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseBackgroundView.layer.cornerRadius = 35
        reverseBackgroundView.clipsToBounds = true
        reverseBackgroundView.alpha = 0
        
        playPauseBackgroundView.layer.cornerRadius = 35
        playPauseBackgroundView.clipsToBounds = true
        playPauseBackgroundView.alpha = 0

        
        forwardBackgroundView.layer.cornerRadius = 35
        forwardBackgroundView.clipsToBounds = true
        forwardBackgroundView.alpha = 0
    }

    // MARK: - Actions
    @IBAction func touchDown(_ button: UIButton) {
        let buttonBackgroundView: UIView
        
        switch button {
        case reverseButton:
            buttonBackgroundView = reverseBackgroundView
            
        case playPauseButton:
            buttonBackgroundView = playPauseBackgroundView
            
        case forwardButton:
            buttonBackgroundView = forwardBackgroundView
            
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackgroundView.alpha = 0.3
            button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @IBAction func touchUpInside(_ button: UIButton) {
        let buttonBackgroundView: UIView
        
        switch button {
        case reverseButton:
            buttonBackgroundView = reverseBackgroundView
            
        case playPauseButton:
            buttonBackgroundView = playPauseBackgroundView
            
        case forwardButton:
            buttonBackgroundView = forwardBackgroundView
            
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations:{
            buttonBackgroundView.alpha = 0
            buttonBackgroundView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            button.transform = .identity
        }) {(_) in
            buttonBackgroundView.transform = .identity
        }
    }
    
    @IBAction func playPauseButtonTapped(_ button: UIButton) {
        if isPlaying{
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = .identity
            }
        }
        // true --> false veya false --> true için toggle kullanılır.
        isPlaying.toggle()
    }
}

