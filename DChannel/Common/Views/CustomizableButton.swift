//
//  CustomizableButton.swift
//  DChannel
//
//  Created by Eranga Prabath on 2024-03-15.
//

import SwiftUI

struct CustomizableButton: View {
    @State var buttonText:String
    @State var buttonColor:Color
    @State var buttonWidth:CGFloat
    @State var buttonHeight:CGFloat
    @State var buttonImage:Bool
    @State var textColor:Color
    @State var buttonAction:()->Void
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
           buttonDesign
        })
    }
}
extension CustomizableButton{
    private var buttonDesign:some View{
        ZStack(){
            RoundedRectangle(cornerRadius: 25)
                .frame(width: buttonWidth,height: buttonHeight)
                .foregroundStyle(buttonColor)
            HStack(alignment:.center){
        
                Text(buttonText)
                    .textCase(.uppercase)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(textColor)
               
                if buttonImage == true{
                    Image(systemName: "arrowshape.forward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)
                        .foregroundStyle(.white)
                }
                
            }
        }
    }
}
#Preview {
    CustomizableButton(buttonText: "NEXT", buttonColor: .purple, buttonWidth: 200, buttonHeight: 55, buttonImage: true, textColor: .white, buttonAction: {})
}
