//
//  CalendarHome.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/02.
//

import SwiftUI

struct CalendarHome: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 20) {
                
                //custom Data Picker...
                CustomDataPicker(currentDate: $currentDate)
                
                
            }
        }
    }
}

struct CalendarHome_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHome()
    }
}
