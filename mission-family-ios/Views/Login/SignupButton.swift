//
//  Element.swift
//  mission-family-ios
//
//  Created by 전태구 on 2022/01/01.
//

import SwiftUI

struct SignupButton: View {
    var body: some View {
        
            Button(action: {
                
            }) {
                NavigationLink(destination: MainSignupView()) {
                    Text("가입하기")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
    }
}

struct SignupButton_Previews: PreviewProvider {
    static var previews: some View {
        SignupButton()
    }
}
