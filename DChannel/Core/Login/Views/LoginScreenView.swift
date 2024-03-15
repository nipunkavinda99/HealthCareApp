//
//  LoginScreenView.swift
//  DChannel
//
//  Created by Eranga Prabath on 2024-03-15.
//

import SwiftUI

struct LoginScreenView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State var userName:String = ""
    @State var password:String = ""
    @State var nextScreen:Bool = false
    var body: some View {
        ZStack{
            Color.purple.opacity(0.4)
                .ignoresSafeArea()
            backgroundDesign
            VStack{
                wording
                textFields
                    .padding(.vertical,20)
                CustomizableButton(buttonText: "Sign In", buttonColor: .white, buttonWidth: 330, buttonHeight: 55, buttonImage: false, textColor: .purple, buttonAction: {
                    viewModel.loginCredentialCheck(userName: userName, password: password)
                }).onReceive(viewModel.$loginSuccessToggle, perform: { value in
                    if value == true{
                        nextScreen = true
                    }
                })
            }
            
        }.navigationDestination(isPresented: $nextScreen) {
           EmptyView()
                 .navigationBarTitleDisplayMode(.automatic)
                 .navigationBarBackButtonHidden(true)
         }
    }
}
extension LoginScreenView{
    private var textFields:some View{
        VStack(spacing:20){
            TextField("User Name",text:$userName )
                .foregroundStyle(.white)
                .frame(width: 300,height: 55)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.bar,lineWidth: 2)
                }
            SecureField("Password",text:$password)
                .foregroundStyle(.white)
                .frame(width: 300,height: 55)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.bar,lineWidth: 2)
                       
                }
        }
    }
    private var wording:some View{
        VStack{
            Text("SIGN IN")
                .font(.system(size: 33))
                .fontWeight(.bold)
                .textCase(.uppercase)
                .foregroundStyle(.bar)
               
        }
    }
    private var backgroundDesign:some View{
        RoundedRectangle(cornerRadius: 50)
            .rotation(Angle(degrees: -45))
            .foregroundStyle(.purple.opacity(1))
            .frame(width: 450)
            .offset(x:-220,y: -100)
    }
}

#Preview {
    LoginScreenView()
}
