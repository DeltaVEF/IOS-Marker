//
//  ViewController.swift
//  VEF
//
//  Created by Colin Rosen on 3/5/16.
//  Copyright © 2016 Delta FHICT. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var tfRoomCode: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnJoin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide navigation bar
        self.navigation
        self.navigationController?.navigationBarHidden = true
        
        // Bind keyboard show/hide listeners
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
    }

    @IBAction func textfieldExit(sender: AnyObject) {
        sender.resignFirstResponder()
        performSegueWithIdentifier("login", sender: btnJoin)
        // TODO:
        // checkCode()
    }
    
    // Make sure the scrollview will be resized when the keyboard is opened en closed
    func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        keyboardFrame = self.view.convertRect(keyboardFrame, fromView: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsetsZero
        self.scrollView.contentInset = contentInset
    }
    
    @IBAction func btnJoin_Press(sender: UIButton) {
        checkCode()
    }
    
    private func checkCode() {
        Network.request(.GET, args: ["room":tfRoomCode.text!, "join": ""], view: self, showError: false) {
            (code: Int) in
            
            if (code == 200) {
                self.performSegueWithIdentifier("login", sender: self.btnJoin)
            } else {
                Utils.alert("Error", message: "Unable to join room", view: self)
            }
        }
    }
}

