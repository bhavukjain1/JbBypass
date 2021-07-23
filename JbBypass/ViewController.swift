//
//  ViewController.swift
//  JbBypass
//
//  Created by Bhavuk Jain on 18/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deviceStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isDeviceJailbroken() {
            deviceStatus.text = "Device is Jailbroken"
        }else {
            deviceStatus.text = "Device is not Jailbroken"
        }
    }
    
    
    func isDeviceJailbroken() -> Bool {
        
        let paths = [
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/private/var/lib/apt/",
            "/Applications/Cydia.app"
        ]

        for path in paths {
            if fileExists(path: path) {
                print(path)
                return true
            }
        }

        return false
    
    }
    
    func fileExists(path:String) -> Bool {
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.path {
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: pathComponent) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}

