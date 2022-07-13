//
//  LoginViewModel.swift
//  FireChatMVVM
//
//  Created by Avijeet Pandey on 13/07/22.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
