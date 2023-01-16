//
//  LoginView.swift
//  SSS
//
//  Created by 송유원 on 1/13/23.
//

import Foundation
import SwiftUI

struct LoginView : View {
    
    @State var emailInput : String = ""
    @State var idInput : String = ""
    @State var pswInput : String = ""
    @State var reEnterPswInput : String = ""
    @State var birthInput : String = ""
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Sign Up Info"), content: {
                    TextField("ID",text: $idInput)
                    SecureField("Password",text: $pswInput)
                    SecureField("Re-enter Password",text: $reEnterPswInput)
                    TextField("Email",text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                    TextField("Birth date",text: $birthInput)
                })
                Section {
                    Button(action: {
                        print("Sign Up")
                    }, label: {
                        Text("Sign Up")
                    })
                }
            }
        }.navigationTitle("Sign Up")
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

#endif


