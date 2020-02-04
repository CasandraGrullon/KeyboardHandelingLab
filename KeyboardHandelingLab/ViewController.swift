//
//  ViewController.swift
//  KeyboardHandelingLab
//
//  Created by casandra grullon on 2/3/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    private lazy var tapGesture: UITapGestureRecognizer = {
       let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(didTap(_:)))
        gesture.numberOfTapsRequired = 1
        return gesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc private func didTap(_ gesture: UITapGestureRecognizer ) {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            fatalError("could not cast to login view")
        }
        
        navigationController?.pushViewController(loginVC, animated: true)
    }

}

