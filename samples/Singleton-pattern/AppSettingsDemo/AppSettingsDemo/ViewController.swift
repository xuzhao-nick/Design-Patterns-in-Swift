//
//  ViewController.swift
//  AppSettingsDemo
//
//  Created by nickxu on 26/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let theme = AppSettings.shared.string(forKey: "Theme")
        {
            print("Theme: \(theme)")
        }
    }


}

