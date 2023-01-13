//
//  UserSetting.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/16.
//

import SwiftUI

struct UserSetting: View {
    
    
    
    @AppStorage("hWage") var hWage = ""
    @AppStorage("OT_Key") var uOT  = ""
    @AppStorage("day_night") var shiftWork = false
    
    
    var body: some View {
        VStack{
            HStack(spacing: 30){
                Circle()
                    .frame(width: 100, height: 100)
                    
                Text("User Name")
            }
            .padding(.horizontal)
            .padding(.trailing, 100)
            
            
            TextField("시급을 입력하세요", text: $hWage)
            TextField("잔업의 배수를 입력하세요", text: $uOT)
        Group{
                Toggle("교대근무가 있나요 ?", isOn: $shiftWork)
            }
            
        }
    }
}



struct UserSetting_Previews: PreviewProvider {
    static var previews: some View {
        UserSetting()
    }
}