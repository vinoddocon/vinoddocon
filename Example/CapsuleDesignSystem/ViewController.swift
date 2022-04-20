//
//  ViewController.swift
//  CapsuleDesignSystem
//
//  Created by Vinod Rathod on 03/24/2022.
//  Copyright (c) 2022 Vinod Rathod. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let vc = UIHostingController.init(rootView: ButtonUIView())
        addChildViewController(vc)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        
        NSLayoutConstraint.activate([
            vc.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            vc.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            vc.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vc.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

