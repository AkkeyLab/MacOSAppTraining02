//
//  ViewController.swift
//  Training
//
//  Created by Akkey on 2016/08/27.
//  Copyright © 2016年 AkkeyLab. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var outPutImage: NSImageView!
    private let alert = NSAlert()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func savePush(sender: AnyObject) {
        let panel = NSOpenPanel()
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false
        panel.beginWithCompletionHandler({ (num) -> Void in
            if num == NSModalResponseOK {
                NSLog("\(panel.directoryURL?.path)")

                self.readItem((panel.directoryURL?.path)! + "/sample.png")
            }
        })
    }

    func readItem(url: String) {

        if (NSImage(contentsOfFile: url) != nil) {
            let image: NSImage = NSImage(contentsOfFile: url)!
            outPutImage.image = image
        } else {
            alert.messageText = "Error"
            alert.informativeText = "Not find sample.png"
            alert.runModal()
        }
    }

    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }

}

