//
//  TextToSpeechViewController.swift
//  TextToSpeech
//
//  Created by Felipe Costa on 8/23/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit
import AVFoundation

class TextToSpeechViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    
    let synthesizer = AVSpeechSynthesizer()
    
    
    var arrVoiceLanguages: [String] = []
    var currentLanguage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rateSlider.minimumValue = 0.0
        rateSlider.maximumValue = 1.0
        pitchSlider.minimumValue = 0.5
        pitchSlider.maximumValue = 2.0
        self.languagePicker.delegate = self
        self.languagePicker.dataSource = self
        prepareLanguageList()

    }
    
    @IBAction func Speak(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: textView.text)
        utterance.voice = AVSpeechSynthesisVoice(language: currentLanguage)
        utterance.rate = rateSlider.value
        utterance.pitchMultiplier = pitchSlider.value
        synthesizer.speak(utterance)
    }
    
    func prepareLanguageList(){
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            let code = (voice as AVSpeechSynthesisVoice).language
            arrVoiceLanguages.append(code)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print(arrVoiceLanguages.count)
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(arrVoiceLanguages.count)
        return arrVoiceLanguages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentLanguage = arrVoiceLanguages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrVoiceLanguages[row]
    }
 
}
