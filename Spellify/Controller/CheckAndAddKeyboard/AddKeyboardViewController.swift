//
//  AddKeyboardViewController.swift
//  Spellify
//
//  Created by Macmini on 12/13/18.
//  Copyright © 2018 Alexander. All rights reserved.
//

import UIKit

class AddKeyboardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAddGrammarlyKeyboard(_ sender: Any) {
        UIManager.shared.showMain(animated: true)
    }
}
