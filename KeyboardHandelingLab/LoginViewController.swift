//
//  LoginViewController.swift
//  KeyboardHandelingLab
//
//  Created by casandra grullon on 2/3/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    private var originalConstraint: NSLayoutConstraint!
    
    private var keyboardIsVisible = false
    
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerKeyboardNotifications()
        usernameText.delegate = self
        passwordText.delegate = self
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //TODO: add safari view controller to website
    }
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc
    private func keyboardWillShow(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?["UIKeyboardFrameBeginUserInfoKey"] as? CGRect else {
            return
        }
        moveKeyboardUp(keyboardFrame.size.height)
    }
    private func moveKeyboardUp(_ height: CGFloat) {
         
         if keyboardIsVisible { return }
         originalConstraint = imageViewTopConstraint
         
         imageViewTopConstraint.constant -= height
         
         UIView.animate(withDuration: 0.3) {
             self.view.layoutIfNeeded()
         }
         
         keyboardIsVisible = true
     }
    private func unregisterKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc
    private func keyboardWillHide(_ notification: NSNotification) {
        resetUI()
    }
    private func resetUI() {
        keyboardIsVisible = false
        imageViewTopConstraint.constant -= originalConstraint.constant
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
