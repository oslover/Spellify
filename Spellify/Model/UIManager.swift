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
        UINavigationBar.appearance().barTintColor = Colors.dark
        UINavigationBar.appearance().tintColor = Colors.white
        UINavigationBar.appearance().backgroundColor = Colors.dark
        UIBarButtonItem.appearance().tintColor = Colors.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
    }
    
    func showMainAfterKeyboardCheck(animated: Bool = false) {
        if AppManager.shared.isKeyboardExtensionEnabled() {
            self.showMain(animated: animated)
        }
        else {
            self.showKeyboardSettings(animated: animated)
        }
    }
    
    func showMain(animated: Bool = false) {
        if let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
            self.showViewController(controller: controller, animated: animated)
        }
    }
    
    func showWelcome(animated: Bool = false) {
        if let controller = UIStoryboard(name: "Welcome", bundle: nil).instantiateInitialViewController() {
            self.showViewController(controller: controller, animated: animated)
        }
    }
    
    func showKeyboardSettings(animated: Bool = false) {
        if let controller = UIStoryboard(name: "AddKeyboard", bundle: nil).instantiateInitialViewController() {
            self.showViewController(controller: controller, animated: animated)
        }
    }
    
    func showViewController(controller: UIViewController, animated: Bool = false) {
        if let window = UIApplication.shared.keyWindow {
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
        else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appDelegate.window?.rootViewController = controller
            appDelegate.window?.makeKeyAndVisible()
        }
        
    }
}
