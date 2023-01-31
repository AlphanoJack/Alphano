//
//  CalendarHome.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/02.
//

import SwiftUI

struct CalendarHome: View {
    
    @State var currentDate: Date = Date()
    
    @Binding var pickingDate: Date
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 20) {
                
                //custom Data Picker...
                CustomDataPicker(currentDate: $currentDate, pickingDate: $pickingDate)
                
                
            }
            .padding(.vertical)
        }
        // Safe Area View...
        .safeAreaInset(edge: .bottom) {
            
            HStack {
                
                Button(action: {
                    
                }, label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.orange, in: Capsule())
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Add Remainder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.green, in: Capsule())
                })
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            
        }
    }
}

struct CalendarHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
