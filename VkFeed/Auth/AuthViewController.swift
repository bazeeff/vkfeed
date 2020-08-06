//
//  AuthViewController.swift
//  VkFeed
//
//  Created by Ivan0v42 on 21.05.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit



class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()

        authService = AppDelegate.shared().authService
        
    }


    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
    
}
