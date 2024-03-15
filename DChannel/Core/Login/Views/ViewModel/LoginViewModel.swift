//
//  LoginViewModel.swift
//  DChannel
//
//  Created by Eranga Prabath on 2024-03-15.
//

import Foundation

class LoginViewModel:ObservableObject{
    
    @Published var loginSuccessToggle:Bool = false
    
    func loginCredentialCheck(userName:String,password:String){
        let userNameCredential = "User1"
        let passwordCredential = "User1"
        print(password)
        if  userNameCredential == userName && passwordCredential == password{
            loginSuccessToggle.toggle()
            print(loginSuccessToggle.description)
        }
    }
}
