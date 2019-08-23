//
//  TextToSpeechViewController.swift
//  TextToSpeech
//
//  Created by Felipe Costa on 8/23/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit
import AVFoundation

class TextToSpeechViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Speak(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: textView.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
    }
}
