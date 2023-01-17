//
//  UserSetting.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/16.
//

import SwiftUI

struct UserSetting: View {
    
    @State var showPicker = false
    @State var selectedImage: UIImage?
    
    
    
    @AppStorage("hWage") var hWage = ""
    @AppStorage("OT_Key") var uOT  = ""
    @AppStorage("user_OT") var userOT = false
    @AppStorage("day_night") var shiftWork = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack(spacing: 30){
                    ZStack{
                        if selectedImage != nil {
                            
                            
                            
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                        Button(action: {
                            
                            // Show Image Picker
                            showPicker = true
                        }, label: {
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .opacity(showPicker ? 1 : 0)
                                
                        }).sheet(isPresented: $showPicker, onDismiss: nil) {
                            // Image Picker
                            ImagePicker(selectedImage: $selectedImage, showPicker: $showPicker)
                            
                        }
                        
                    }
                    VStack(spacing: 15){
                        Text("User Name")
                        Text("User e-mail")
                        Text("User birthday")
                        NavigationLink(destination: UserFixPersonalData()){
                            Text("비밀번호 변경")
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.trailing, 100)
                
                
                TextField("시급을 입력하세요", text: $hWage)
                TextField("잔업의 배수를 입력하세요", text: $uOT)
                Group{
                    Toggle("잔업이 있나요?", isOn: $userOT)
                }
                Group{
                    Toggle("교대근무가 있나요 ?", isOn: $shiftWork)
                }
                
            }
        }
    }

//    func ImageSave() {
//        let saveImage = selectedImage
//        let saveImage = UserDefaults.standard.value(forKey: "save_Image")
//    }
}




struct UserSetting_Previews: PreviewProvider {
    static var previews: some View {
        UserSetting()
    }
}
