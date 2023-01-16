//
//  LoginPage.swift
//  SSS
//
//  Created by 송유원 on 1/13/23.
//

import SwiftUI

struct LoginPage: View {
    
    @AppStorage("hWage") var id = ""
    @AppStorage("OT_Key") var psw  = ""
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 160))
                Spacer()
                
                TextField("ID", text: $id)
                TextField("Password", text: $psw)
                
                NavigationLink(destination: ContentView(),
                               label: {
                    HStack{
                        Spacer()
                        Text("Login")
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                
                NavigationLink(destination: LoginView(),
                               label: {
                    HStack{
                        Spacer()
                        Text("Sign Up")
                        Spacer()
                    }
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                NavigationLink(destination: ContentView(),
                               label: {
                    HStack{
                        Spacer()
                        Text("Guest Login")
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                Spacer()
                Spacer()
            }
        }
    }
    
    struct LoginPage_Previews: PreviewProvider {
        static var previews: some View {
            LoginPage()
        }
    }
}
