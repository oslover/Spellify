//
//  SignUpViewController.swift
//  Spellify
//
//  Created by Macmini on 12/13/18.
//  Copyright © 2018 Alexander. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        UIManager.shared.showMainAfterKeyboardCheck(animated: true)
    }
}
