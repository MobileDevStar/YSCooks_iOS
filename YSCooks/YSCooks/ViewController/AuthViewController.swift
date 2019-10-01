//
//  ViewController.swift
//  YSCooks
//
//  Created by simba on 10/1/19.
//  Copyright © 2019 simba. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var mViewSignup: UIView!
    @IBOutlet weak var mViewSignin: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickedGoSignin(_ sender: UIButton) {
        mViewSignin.isHidden = false
        mViewSignup.isHidden = true
    }
}

