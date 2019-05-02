//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by beibei cai on 2019-05-01.
//  Copyright © 2019 Jerrick Cai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {

    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet var speakButton: NSButton!
    @IBOutlet var stopButton: NSButton!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
    override func viewDidLoad() {
        speechSynthesizer.delegate = self
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking: Bool) {
        if didFinishSpeaking {
            speakButton.isEnabled = true
            progressIndicator.stopAnimation(speakButton)
        }
    }
    
    @IBAction func speakButtonClicked(_ sender: NSButton){
        if let contents = textView?.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        }else{
            speechSynthesizer.startSpeaking("the codument is empty")
        }
        speakButton.isEnabled = false
        progressIndicator.display()
        progressIndicator.startAnimation(speakButton)
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton){
        speechSynthesizer.stopSpeaking()
    }


}

