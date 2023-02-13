//
//  BBB.swift
//  SSS
//
//  Created by 서재혁 on 2022/11/28.
//

import SwiftUI
import Combine

struct BBB: View {
    
    
    
    @AppStorage("hWage") var hWage = ""
//    @State private var num1 = ""
//    @State var num2 = ""
    @AppStorage("second_Key") var num2 = ""
    @AppStorage("last_Key") var num4 = 0
    @State var overTimeBox = ""
    @State var checkedOverTime = false
    @AppStorage("OT_Key") var uOT  = 1.5
    @Binding var pickingDate : Date
    @AppStorage("user_OT") var userOT = false
    @AppStorage("day_night") var shiftWork = false
    @AppStorage("night_work") var nightWork = ""
    var NightAdditional : Double = 1.5
    
    
   
   
   
   
    
    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                NavigationLink(destination: BBBList(hWage: $hWage, num2: $num2, overTimeBox: $overTimeBox)
                ){
                    Image(systemName: "person")
                }

                Text("시급 : \(hWage)")
                TextField("숫자 num2", text: $num2)
               

                TextField("Over Time", text:$overTimeBox)
                    .opacity(userOT ? 1.0 : 0)
                    
                   
//                Button(action: {
//                    self.checkedOverTime.toggle()
//                    overTimeBox = ""
//
//                }, label: {
//                    Text("OverTime")
//                })
                
                
                TextField("Night Time", text: $nightWork)
                    .opacity(shiftWork ? 1.0 : 0)
                
                
                
                Text("num1 + num2 = \(num1num2())")
                
                Button(action: {
                    self.plusAll()
                    
                    
                }, label: {
                    Text("합산")
                })
                
                Text("plus\(num4)")
                
                DatePicker("Select a date", selection: $pickingDate)
                    .accentColor(Color.red)
                    .datePickerStyle(
                        CompactDatePickerStyle()
                    )
                
                
                Button(action: {
                    num4 = 0
                    //여기다가 월별 정산후에 다른값으로 넘겨주는 로직 줘야함 그래야 월별이건 주간별이건 데이터를 축척 가능함
     
                    
                    
                }, label: {
                    Text("정산하기")
                })
                
                
                
            }
            .navigationTitle("Working")
                .navigationBarTitleDisplayMode(.automatic)
           
        }
        
    }
    

    
    
    func num1num2() -> Int {
        let Num1 = Double(hWage) ?? 0
        let Num2 = Double(num2) ?? 0
        let Num3 = Num1 * Num2
        let OverTimeBox = Double(overTimeBox) ?? 0
        let userOT = Double(uOT)
        let NightWork = Double(nightWork) ?? 0
        let NightTotal = Num1 * NightWork * NightAdditional
        let OT = Num1 * OverTimeBox * userOT
        let TotalHourlyWage = Num3 + OT + NightTotal
        
        
        
        

        return Int(TotalHourlyWage)
    }
    
    func plusAll() {
        _ = Double(num4)
        let sum = num1num2()
        
        if num1num2() >= 0 {
            num4 += sum
        }
        UserDefaults.standard.value(forKey: "data")
    }
    
    
    
}

//struct BBB_Previews: PreviewProvider {
//    static var previews: some View {
//        BBB()
//    }
//}




