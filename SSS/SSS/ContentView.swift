//
//  ContentView.swift
//  SSS
//
//  Created by 서재혁 on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView{
            BBB()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
//            BBBList()
//                .tabItem{
//                    Label("Calculator", systemImage: "dollarsign.circle")
//                }
            CalendarHome()
                .tabItem{
                    Label("Calendar", systemImage: "calendar.badge.clock")
                }
           
            
        }
        
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

