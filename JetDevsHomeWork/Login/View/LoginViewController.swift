//
//  LoginViewController.swift
//  JetDevsHomeWork
//
//  Created by APPLE on 07/12/22.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

/* View/ViewController display visual elements and controls on the screen such as buttons, labels, images, text fields etc..*/

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    @IBOutlet weak var passwordTextField: MDCOutlinedTextField!
    
    lazy var loginViewModel = {
        LoginViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
       }
    
    func initSetup() {
        self.emailTextField.textContentType = .emailAddress
        self.emailTextField.label.text = "Email"
        self.emailTextField.placeholder = "Email"
        self.emailTextField.leadingAssistiveLabel.text = ""
        self.passwordTextField.label.text = "Password"
        self.passwordTextField.placeholder = "Password"
        self.emailTextField.leadingAssistiveLabel.text = ""
        self.emailTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .normal)
        self.passwordTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .normal)
        self.emailTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .editing)
        self.passwordTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .editing)


        self.emailTextField.setLeftPaddingPoints(8)
        self.passwordTextField.setLeftPaddingPoints(8)
        self.btnLogIn.sizeToFit()
        self.btnLogIn.contentVerticalAlignment = .fill
        self.btnLogIn.backgroundColor = UIColor.lightGray
        self.btnLogIn.titleLabel?.text = "LogIn"
        self.btnLogIn.titleLabel?.textColor = UIColor.white
        
        
        
#if targetEnvironment(simulator)
        print("targetEnvironment simulator")
        self.emailTextField.text = "test@jetdevs.com"
        self.passwordTextField.text = "Jetdevs2021"
#endif

    }
    
    @IBAction func signinButtonActionTapped(sender: UIButton) {
        self.emailTextField.leadingAssistiveLabel.text = ""
        self.emailTextField.leadingAssistiveLabel.text = ""
        
        //Here we ask viewModel to update model with existing credentials from text fields
        loginViewModel.updateCredentials(emailId: self.emailTextField.text!, password: self.passwordTextField.text!)
        
        //Here we check user's credentials input - if it's correct we call login()
                switch loginViewModel.credentialsInput() {
                case .correct:
                    loginViewModel.login()
                case .incorrect:
                    self.bindData()
                    return
                }
        
    }
    
    
    func bindData() {
         loginViewModel.credentialsInputEmailErrorMessage.bind { [weak self] in
             self!.emailTextField.leadingAssistiveLabel.text = $0
             self!.emailTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .normal)
             self!.emailTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .editing)
         }
        
        loginViewModel.credentialsInputPasswordErrorMessage.bind { [weak self] in
            self!.passwordTextField.leadingAssistiveLabel.text = $0
            self!.passwordTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .normal)
            self!.passwordTextField.setLeadingAssistiveLabelColor(UIColor.red, for: .editing)

        }
         
//         loginViewModel.isUsernameTextFieldHighLighted.bind { [weak self] in
//             if $0 { self?.emailTextField.highlightTextField()}
//
//         }
//
//         loginViewModel.isPasswordTextFieldHighLighted.bind { [weak self] in
//             if $0 { self?.passwordTextField.highlightTextField()}
//
//         }
        
     }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.emailTextField.leadingAssistiveLabel.text = ""
        self.passwordTextField.leadingAssistiveLabel.text = ""
    }
    
}
