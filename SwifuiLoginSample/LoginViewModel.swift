//
//  LoginViewModel.swift
//  SwifuiLoginSample
//
//  Created by Marlon Boncodin on 7/12/24.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: NSObject, ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()

    @Published var showLoader = false

    @Published var emailInput: String = ""
    @Published var passwordInput: String = ""
    
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    
    @Published var emailErrorMessage: String = ""
    
    @Published var shoudProceed: Bool = false
    @Published var buttonBackgroundColor: Color = Color.gray

    @Published var showSuccessLogin: Bool = false

    override init() {
        super.init()
        
        $emailInput
            .sink { [weak self] input in
                //validated email, can be transfered to extensions
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                self?.isEmailValid = emailPred.evaluate(with: input)
            }.store(in: &subscriptions)
        
        $passwordInput
            .sink { [weak self] input in
                //validated password, password chars should be greater than 0
                self?.isPasswordValid = input.count > 0
            }.store(in: &subscriptions)
        
        Publishers
            .CombineLatest($isEmailValid, $isPasswordValid)
            .sink { [weak self] validEmail, validPassword  in
                self?.emailErrorMessage = validEmail ? "" : "Invalid email format..."
                self?.shoudProceed = validEmail && validPassword
                self?.buttonBackgroundColor = validEmail && validPassword ? Color.blue : Color.gray
            }.store(in: &subscriptions)
        
    }
    
    func login() {
        showLoader.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.showLoader.toggle()
            self?.showSuccessLogin = true //force
        }
    }
    
}
