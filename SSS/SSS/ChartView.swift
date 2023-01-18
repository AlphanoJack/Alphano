//
//  ChartView.swift
//  SSS
//
//  Created by 서재혁 on 2023/01/17.
//

import SwiftUI
import Charts


struct ChartView: View {
    
    @State var sampleAnalytics: [SiteView] = sample_analytics
    
    @State var currentTab : String = "7 Days"
    
    @State var currentActiveItem : SiteView?
    
    @State var plotWidth : CGFloat = 0
    
    @State var isLineGraph = false
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Text("views")
                            .fontWeight(.semibold)
                        
                        Picker("", selection: $currentTab) {
                            Text("7 Days")
                                .tag("7 Days")
                            Text("Week")
                                .tag("Week")
                            Text("Month")
                                .tag("Month")
                        }
                        .pickerStyle(.segmented)
                        .padding(.leading, 80)
                    }
                    
                    let totalValue = sampleAnalytics.reduce(0.0) { partialResult, item in
                        item.views + partialResult
                        
                    }
                    
                    Text(totalValue.stringFormat)
                        .font(.largeTitle.bold())
                    
                    AnimatedChart()
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white.shadow(.drop(radius: 2)))
                }
                Toggle("Line Graph", isOn: $isLineGraph)
                    .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("Chart View")
            // simply Updating Values for segmented tabs
            .onChange(of: currentTab) { newValue in
                
                sampleAnalytics = sample_analytics
                if newValue != "7 Days"{
                    for(index,_) in sampleAnalytics.enumerated(){
                        sampleAnalytics[index].views = .random(in: 1500...10000)
                    }
                }
                
                // Re Animating View
                animateGraph(fromChange: true)
            }
        }
    }
    
    @ViewBuilder
    func AnimatedChart() -> some View {
        let max = sampleAnalytics.max{ item1, item2 in
            
            return item2.views > item1.views
        }?.views ?? 0
        
        
        Chart{
            ForEach(sampleAnalytics){ item in
                
                if isLineGraph{
                    LineMark(
                        x: .value("Hour", item.hour, unit: .hour),
                        y: .value("Views", item.animate ? item.views : 0)
                    )
                    //Applying Gradiant Style
                    .foregroundStyle(Color(.systemCyan).gradient)
                    .interpolationMethod(.catmullRom)
                }else{
                    BarMark(
                        x: .value("Hour", item.hour, unit: .hour),
                        y: .value("Views", item.animate ? item.views : 0)
                    )
                    //Applying Gradiant Style
                    .foregroundStyle(Color(.systemCyan).gradient)
                }
                
                if isLineGraph {
                    AreaMark(
                        x: .value("Hour", item.hour, unit: .hour),
                        y: .value("Views", item.animate ? item.views : 0)
                    )
                    //Applying Gradiant Style
                    .foregroundStyle(Color(.systemCyan).opacity(0.1).gradient)
                    .interpolationMethod(.catmullRom)
                }
                
                // Rule Mark for Currently Dragging Item
                if let currentActiveItem,currentActiveItem.id == item.id{
                    RuleMark(x: .value("Hour", currentActiveItem.hour))
                    // Dotted Style
                        .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                    // Setting in Middle Of Each Bars
                        .offset(x: (plotWidth / CGFloat(sampleAnalytics.count)) / 2)
                        .annotation(position: .top){
                            VStack(alignment: .leading, spacing: 6){
                                Text("Views")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(currentActiveItem.views.stringFormat)
                                    .font(.title3.bold())
                            
                                
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background{
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .fill(.white.shadow(.drop(radius: 2)))
                            }
                        }
                }
            }
        }
        .chartYScale(domain: 0...(max + 5000))
        // Gesture To Highlight Current Bar
        .chartOverlay(content: { proxy in
            GeometryReader{ innerProxy in
                Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                // Getting current location
                                let location = value.location
                                // Extracting Value From The location
                                // Swift Chart Gives The Direct Abillty to do that
                                // We're going to extract the Date in A-Axis Then with the help of That Date Value We're extracting the current Item
                                
                                // Don't forget to Include the perfact Date Type
                                if let date: Date = proxy.value(atX: location.x){
                                    
                                    //Extracting Hour
                                    let calendar = Calendar.current
                                    let hour = calendar.component(.hour, from: date)
                                    
                                    if let currentItem = sampleAnalytics.first(where: { item in
                                        calendar.component(.hour, from: item.hour) == hour
                                    }){
                                        self.currentActiveItem = currentItem
                                        self.plotWidth = proxy.plotAreaSize.width
                                    }
                                    
                                }
                            }.onEnded{ value in
                                self.currentActiveItem = nil
                            }
                    )
            }
        })
        .frame(height: 250)
        .onAppear {
                    animateGraph()
                    }
                }
               
            
        

    // Animating Graph
func animateGraph(fromChange: Bool = false){
    for (index,_) in sampleAnalytics.enumerated(){
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.03 : 0.05)){
            withAnimation(fromChange ? .easeInOut(duration: 0.8) : .interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)){
                
                sampleAnalytics[index].animate = true
            }
        }
    }
}
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

extension Double {
    var stringFormat : String {
        if self >= 10000 && self < 999999 {
            return String(format: "%.1fk", self / 1000).replacingOccurrences(of: ".0", with: "")
        }
        if self > 999999 {
            return String(format: "%.1fkM", self / 100000).replacingOccurrences(of: ".0", with: "")
        }
        return String(format: "%.0f", self)
    }
}
