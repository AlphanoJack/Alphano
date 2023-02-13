//
//  ContentView.swift
//  SSS
//
//  Created by 서재혁 on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
   
    @State var pickingDate = Date()
    
    var body: some View {
        TabView{
            BBB(pickingDate: $pickingDate)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
//            BBBList()
//                .tabItem{
//                    Label("Calculator", systemImage: "dollarsign.circle")
//                }
            CalendarHome(pickingDate: $pickingDate)
                .tabItem{
                    Label("Calendar", systemImage: "calendar.badge.clock")
                }
            UserSetting()
                .tabItem{
                    Label("UserSetting", systemImage: "gear")
                }
           
            
        }
        
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

