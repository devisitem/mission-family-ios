//
//  MainLoginView.swift
//  mission-family-ios
//
//  Created by 전태구 on 2021/12/31.
//

import SwiftUI

struct MainLoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAutoLogin: Bool = false
    @State private var isSaveId: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.missionPurple.edgesIgnoringSafeArea(.all)
                    Text("Mission Family")
                            .font(.system(size: 40,weight: .bold))
                            .foregroundColor(.white)
                            .background(Color.missionPurple)
                }.frame(height: 60)
                Spacer()
                
                Text("로그인")
                    .font(.system(size: 40,weight: .bold))
                    .foregroundColor(.black)
                    
                
                VStack {
                    TextField("아이디", text: $username)
                        .font(Font.system(size: 15, weight: .medium, design: .default))
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    
                    SecureField("비밀번호", text: $password)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                    
                    Toggle(isOn: $isSaveId) {
                        Text("아이디 저장")
                            .fontWeight(.bold)
                    }
                    .toggleStyle(SwitchToggleStyle.init(tint: Color.missionPurple))
                    .padding(.horizontal, 30)
                    
                    Toggle(isOn: $isAutoLogin) {
                        Text("자동 로그인")
                            .fontWeight(.bold)
                    }
                    .toggleStyle(SwitchToggleStyle.init(tint: Color.missionPurple))
                    .padding(.horizontal, 30)
                    
                        HStack {
                            Text("회원이 아닌가요?")
                                .fontWeight(.bold)
                            
                            Spacer()
                            SignupButton()
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                }
                .background(Color.missionWhite)
                .cornerRadius(15)
                .padding(.horizontal,40)
                
                Button(action: {
                    
                }) {
                    Text("로그인")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 100)
                        .padding(.vertical, 20)
                    
                }
                .background(Color.missionPurple)
                .cornerRadius(15)
                .shadow(radius: 15)
                .padding(.vertical, 40)
                
                Spacer()
            }
            .navigationBarTitle("로그인")
            .navigationBarHidden(true)
        }
    }
}

struct MainLoginView_Previews: PreviewProvider {
    static var previews: some View {
        MainLoginView()
    }
}
