//
//  BBBList.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/05.
//

import SwiftUI
import Combine





struct BBBList: View {
    
    
    
    @Binding var num1 : String
    @Binding var num2 : String
    @Binding var overTimeBox : String
    var mutliplecation : Double = 1.5
    
    @ObservedObject var totalWorkData = myWorkData()
    
    
    
    
    var body: some View {
        
        VStack {
            Section("ABC") {
                VStack{
                    TextField("시급\(num1)", text: $num1)
                    TextField("일한시간\(num2)", text: $num2)
                    TextField("OT\(overTimeBox)", text: $overTimeBox)
                    Text("Today's Total Data : \(todayTotalData())")
                    Button(action: {
                        self.makeTodayData()
                    }, label: {
                        Text("Add to Hourly Wage")
                    })
                }
                .padding()
            }
            List(self.totalWorkData.MyWorkData){ MyData in
                VStack{
                    HStack{
                        Text("일 한시간 :")
                        Text(MyData.myWorkingTime)
                    }
                    HStack{
                        HStack{
                            Text("오늘의 급여")
                            Text(MyData.myTotalWorking)
                        }
                        HStack{
                            Text("잔업 시간")
                            Text(MyData.myOtTime)
                        }
                    }
                }
                
                            }
        }
    }
    
    func todayTotalData() -> String {
        let Num1 = Double(num1) ?? 0
        let Num2 = Double(num2) ?? 0
        let Num3 = Num1 * Num2
        let OverTimeBox = Double(overTimeBox) ?? 0
        let OT = Num1 * OverTimeBox * mutliplecation
        let TodayTotal = Num3 + OT
        let plusTotal : String = String(describing: TodayTotal)
        

        return plusTotal
    }
    
    func makeTodayData() {
        totalWorkData.MyWorkData.append(Work(myWorkingTime: num2, myTotalWorking: todayTotalData(), myOtTime: overTimeBox))
    }
}


struct dayWorkingData : View {
    
    let myWorkingTime : String
    let myTotalWorking : Int
    let myOtTime : String
    
    var body : some View {
        VStack{
            Text("오늘의 금액 :\(myTotalWorking)")
            HStack{
                Text("일한 시간 \(myWorkingTime)")
                Text("잔업 : \(myOtTime)")
            }
        }
        
    }
    
}
