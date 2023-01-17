//
//  CustomDataPicker.swift
//  SSS
//
//  Created by 서재혁 on 2022/12/02.
//

import SwiftUI

struct CustomDataPicker: View {
    
    @Binding var currentDate : Date
    
    // Month update on arrow clickes...
    
    @State var currentMonth : Int = 0
    
    @AppStorage("hWage") var hWage = ""
    
    
    
    var tasks: [TaskMetaData] = [
    TaskMetaData(task: [Task(title: "", dayHwage: "", dayWokrTime: "", dayOTTime: "", dayNightWorkTime: "")], taskDate: getSampleDate(offset: 0))]
    
    var body: some View {
        VStack(spacing: 35){
            
            //Days
            let days : [String] =
            ["일", "월", "화", "수", "목", "금", "토"]
            
            
            HStack(spacing: 20){
                
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(extraDateYear()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    //맨위 year기록하는 칸
                    
                    Text(extraDateYearText()[0])
                        .font(.title.bold())
                    
                }
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    withAnimation{
                        currentMonth -= 1
                        
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                })
                
                Button(action: {
                    
                    withAnimation{
                        currentMonth += 1
                        
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                })
                
            }
            .padding(.horizontal)
            
            //Day View
            HStack(spacing: 0){
                
                ForEach(days, id: \.self) { day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                    
                }
                
            }
            
            
            //Dates ...
            
            //Lazy grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()) { value in
                    
                    CardView(value: value)
                        .background(
                            
                            Capsule()
                                .fill(Color.pink)
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                    
                }
            }
            VStack(spacing: 15){
                
                Text("근무 일지")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                    
                }){
                    // 근무 일지 수정란
                    //여기를 리스트형태나 ? ForEach 루프를 활용해도 상관없으나
                    // bbb에서 버튼클릭 메소드가 전송이 되면 여기서 리스트가 만들어져야함
                    ForEach(task.task){ task in
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            // For Custom Timing...
                            Text(task.time
                                .addingTimeInterval(CGFloat
                                    .random(in: 0...5000)),style:
                                    .time)
                            
                            Text(task.title)
                                .font(.title2.bold())
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color.purple
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                        
                    }
                    
                    }
                else{
                    Text("No task Found")
                }
                
            }
            .padding()
            
        }
        .onChange(of: currentMonth) { newValue in
            
            //upDating month...
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        
        VStack {
            if value.day != -1{
                
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                    
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color.pink)
                        .frame(width: 8, height:  8)
                    
                    
                }
                else {
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
        
    }
    
    //checking dates...
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //extrating Year And Month for display...
    func extraDateYear() -> [String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: "")
        
    }
    
    func extraDateYearText() -> [String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: "")
        
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        // getting Current Month Dates...
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date())
        else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        // getting Current Month Dates...
        let currentMonth = getCurrentMonth()
                
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            //getting day ...
            let day = calendar.component(.day , from: date)
            
            return DateValue(day: day, date: date)
        }
        
        // adding offset days to get exact week day...
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
}

struct CustomDataPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHome()
    }
}

//extenting Date to get current Month Dates...
extension Date {
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        // getting start dates...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        
        
        //getting Dates
        
        return range.compactMap{ day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            
        }
    }
}

