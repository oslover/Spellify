//
//  UIManager.swift
//  Spellify
//
//  Created by Macmini on 12/14/18.
//  Copyright © 2018 Alexander. All rights reserved.
//

import UIKit

class UIManager {
    static let shared = UIManager()
    
    init() {
        configureTheme()
    }
    
    func configureTheme() {
        UINavigationBar.appearance().backgroundColor = Colors.dark
        UIBarButtonItem.appearance().tintColor = Colors.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.white]
    }
    
    func showMain(animated: Bool = false) {
        if let main = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
            self.showViewController(controller: main, animated: animated)
        }
    }
    
    func showWelcome(animated: Bool = false) {
        if let main = UIStoryboard(name: "Welcome", bundle: nil).instantiateInitialViewController() {
            self.showViewController(controller: main, animated: animated)
        }
    }
    
    func showKeyboardSettings(animated: Bool = false) {
        if let main = UIStoryboard(name: "AddKeyboard", bundle: nil).instantiateInitialViewController() {
            self.showViewController(controller: main, animated: animated)
        }
    }
    
    func showViewController(controller: UIViewController, animated: Bool = false) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        guard let rootViewController = window.rootViewController else {
            return
        }
        
        controller.view.frame = rootViewController.view.frame
        controller.view.layoutIfNeeded()
        
        if animated {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.rootViewController = controller
            }, completion: nil)
        }
        else {
            window.rootViewController = controller
        }
    }
}
