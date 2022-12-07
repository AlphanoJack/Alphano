//
//  BBB.swift
//  SSS
//
//  Created by 서재혁 on 2022/11/28.
//

import SwiftUI

struct BBB: View {
    

    @State private var num1 = ""
    @State var num2 = ""
    @State var num4 : Int = 0
    @State var overTimeBox = ""
    @State var checkedOverTime = false
    @State var multipliOT : Double = 1.5
   
    
    
    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                NavigationLink(destination: BBBList(num1: $num1, num2: $num2, overTimeBox: $overTimeBox)
                ){
                    Image(systemName: "person")
                }
                TextField("숫자 num1", text: $num1)
                TextField("숫자 num2", text: $num2)
            HStack{
                TextField("Over Time", text:$overTimeBox)
                    .opacity(checkedOverTime ? 0 : 1.0)
                   
                Button(action: {
                    self.checkedOverTime.toggle()
                    overTimeBox = ""
                }, label: {
                    Text("OverTime")
                })
                }
                
                
                
                Text("num1 + num2 = \(num1num2())")
                
                Button(action: {
                    self.plusAll()
                    num1 = ""
                    num2 = ""
                  overTimeBox = ""

                    
                }, label: {
                    Text("합산")
                })
                
                Text("plus\(num4)")
                

                
            }
            .navigationTitle("Working")
                .navigationBarTitleDisplayMode(.automatic)
           
        }
        
    }
    

    
    
    func num1num2() -> Int {
        let Num1 = Double(num1) ?? 0
        let Num2 = Double(num2) ?? 0
        let Num3 = Num1 * Num2
        let OverTimeBox = Double(overTimeBox) ?? 0
        let MultipliOT = multipliOT
        let OT = Num1 * OverTimeBox * MultipliOT
        let TotalHourlyWage = Num3 + OT
        
        

        return Int(TotalHourlyWage)
    }
    
    func plusAll() {
        _ = Double(num4)
        let sum = num1num2()
        
        if num1num2() >= 0 {
            num4 += sum
        }
    }
    
    
    
}

struct BBB_Previews: PreviewProvider {
    static var previews: some View {
        BBB()
    }
}
