//
//  SplashScreenView.swift
//  DChannel
//
//  Created by Eranga Prabath on 2024-03-15.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var nextScreen:Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                backgroundDesign
                    .offset(y:-50)
                    .ignoresSafeArea()
                Spacer()
                wording
                Spacer()
                CustomizableButton(buttonText: "Let's go", buttonColor: .purple, buttonWidth: 200, buttonHeight: 55, buttonImage: true, textColor: .white, buttonAction: {
                    nextScreen.toggle()
                })
                .padding(.horizontal)
                aboutUs
                Spacer()
                
            }.navigationDestination(isPresented: $nextScreen) {
               LoginScreenView()
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationBarBackButtonHidden(true)
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                nextScreen.toggle()
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.bar)
                            })
                            
                        }
                    })
            }
        }
    }
}
extension SplashScreenView{
    
    private var backgroundDesign:some View{
        ZStack{
            ZStack(alignment:.top){
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(.purple)
                        .frame(height: UIScreen.main.bounds.height * 0.67)
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(.purple.opacity(0.7))
                        .frame(height: UIScreen.main.bounds.height * 0.71)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(.purple.opacity(0.5))
                        .frame(height: UIScreen.main.bounds.height * 0.75)
            }
            
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                Text("DChannel")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.bar)
            }
       
        }
        
    }
    private var wording:some View{
        VStack{
            Text("Streamlining Your Health")
                .font(.system(size: 22))
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(.purple)
            Text("One Appointment at a Time")
                .font(.system(size: 13))
                .font(.body)
                .fontWeight(.medium)
                .foregroundStyle(.black)
        }
    }
    private var aboutUs:some View{
        HStack(spacing:1){
            Text("About")
                .font(.system(size: 15))
                .font(.body)
                .fontWeight(.medium)
                .foregroundStyle(.black)
            Text("DChannel")
                .font(.system(size: 15))
                .underline()
                .font(.body)
                .fontWeight(.medium)
                .foregroundStyle(.purple)
        }
    }
}
#Preview {
    SplashScreenView()
}
