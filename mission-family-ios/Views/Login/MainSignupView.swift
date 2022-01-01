//
//  MainSignupView.swift
//  mission-family-ios
//
//  Created by 전태구 on 2022/01/01.
//

import SwiftUI

struct MainSignupView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordCon: String = ""
    @State private var name: String = ""
    @State private var isAgreePrivacy: Bool = false
    @State private var isGettingReady: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack {
            ScrollView {
                Text("회원가입")
                    .font(.system(size: 40,weight: .bold))
                    .foregroundColor(.black)
                
                
                VStack {
                    TextField("아이디", text: $username, onEditingChanged: { isfocus in
                        if isfocus {
                            print("focus in")
                        } else {
                            let accountRequest = AccountRequest(id: username)
                            let isChecked = get(endPoint: "/api/users/duplicateCheck", requestBody: accountRequest)
                            print("is checked ? : \(isChecked)")
                        }
                    })
                        .font(Font.system(size: 15, weight: .medium, design: .default))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                    
                    SecureField("비밀번호", text: $password)
                        .font(Font.system(size: 15, weight: .medium, design: .default))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                    
                    SecureField("비밀번호 확인", text: $passwordCon)
                        .font(Font.system(size: 15, weight: .medium, design: .default))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                    
                    SecureField("이름", text: $name)
                        .font(Font.system(size: 15, weight: .medium, design: .default))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                    
                    Toggle(isOn: $isAgreePrivacy) {
                        HStack {
                            
                            Button(action: {
                                isGettingReady = true
                            }) {
                                Text("개인정보")
                                    .fontWeight(.bold)
                            }
                        }
                        Text("수집 • 이용 동의")
                            .fontWeight(.bold)
                    }
                    .toggleStyle(SwitchToggleStyle.init(tint: Color.missionPurple))
                    
                    .toggleStyle(SwitchToggleStyle.init(tint: Color.missionPurple))
                    .padding(.horizontal, 30)
                    
                    HStack {
                        Text("정보를 잊으셨나요 ?")
                            .fontWeight(.bold)
                        
                        Spacer()
                        Button(action: {
                            isGettingReady = true
                        }) {
                            Text("계정찾기")
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                }
                .background(Color.missionWhite)
                .cornerRadius(15)
                .padding(.horizontal,40)
                
                Button(action: {
                    
                }) {
                    Text("회원가입")
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
            .alert(isPresented: $isGettingReady) {
                Alert(title: Text("사용 불가"), message: Text("준비중 입니다."),
                      dismissButton: .default(Text("Close")))
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    .background(Color.missionPurple)
                    .cornerRadius(30)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
            }
        }
    }
}

struct MainSignupView_Previews: PreviewProvider {
    static var previews: some View {
        MainSignupView()
    }
}
