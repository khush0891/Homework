//
//  LoginViewModel.swift
//  JetDevsHomeWork
//
//  Created by APPLE on 07/12/22.
//

import Foundation
import UIKit

/* ViewModel responsible for presentation logic, in other words transform model information into values that can be displayed on a view and serves as a bridge between the model and view.*/

class LoginViewModel: NSObject {
        
    private var loginService: ServiceProtocol

    var loginData = LoginModel(){
        didSet {
            emailId = loginData.emailId
            password = loginData.password
        }
    }
    
      private var emailId = ""
      private var password = ""
    
       var credentialsInputEmailErrorMessage: Observable<String> = Observable("")
       var credentialsInputPasswordErrorMessage: Observable<String> = Observable("")
       var isUsernameTextFieldHighLighted: Observable<Bool> = Observable(false)
       var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
       var errorMessage: Observable<String?> = Observable(nil)
    
    
    init(loginService: ServiceProtocol = Services()) {
        self.loginService = loginService
    }
    
        //Here we update our model
        func updateCredentials(emailId: String, password: String, otp: String? = nil) {
            loginData.emailId = emailId
            self.emailId = emailId
            self.password = password
            loginData.password = password
        }
        
    func login() {
        let param: [String: Any] = ["email_id":self.emailId,
                                                   "password":self.password]
        self.loginService.userLoginWithCredentials(param: param) { objResponse in
            
        }
        
    }
    
    
    func credentialsInput() -> CredentialsInputStatus {
        
        
        credentialsInputPasswordErrorMessage.value = ""
        credentialsInputEmailErrorMessage.value = ""

//           if emailId.isEmpty && password.isEmpty {
//               credentialsInputEmailErrorMessage.value = "Please provide your email id."
//               credentialsInputPasswordErrorMessage.value = "Please provide your password."
//               return .incorrect
//           }
           if emailId.isEmpty {
               credentialsInputEmailErrorMessage.value = "Please enter you email id."
               isUsernameTextFieldHighLighted.value = true
               return .incorrect
           }
        
        if self.isValidEmail(emailId) == false {
            credentialsInputEmailErrorMessage.value = "Invalid email id."
            isPasswordTextFieldHighLighted.value = true
            return .incorrect
        }
        
           if password.isEmpty {
               credentialsInputPasswordErrorMessage.value = "Please enter you password."
               isPasswordTextFieldHighLighted.value = true
               return .incorrect
           }
        
        if self.isValidPassword(password) == false {
            credentialsInputEmailErrorMessage.value = "Passwords require atleast 1 uppercase, 1 lower case, 1 special character and a number."
            isPasswordTextFieldHighLighted.value = true
            return .incorrect
        }
        

           return .correct
       }
    
    
    
    func isValidEmail(_ emailStr:String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: emailStr)
    }
    
    func isValidPassword(_ passStr:String) -> Bool {
        let urlRegEx = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]))"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: passStr)
    }
    
    
}


extension LoginViewModel {
    enum CredentialsInputStatus {
        case correct
        case incorrect
    }
}
