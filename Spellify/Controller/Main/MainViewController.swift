//
//  MainViewController.swift
//  Spellify
//
//  Created by Macmini on 12/13/18.
//  Copyright © 2018 Alexander. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "logo_small"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
}
