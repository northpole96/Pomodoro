//
//  countDownView.swift
//  Pomodoro
//
//  Created by Rajesh Khuntia on 06/09/23.
//

import SwiftUI


struct countDownView: View {
    @State private var remainingTime: TimeInterval = 1 * 60
    @State var elapsed=0.0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    
    
    var body: some View {
        ZStack {
            VStack{
            Text(timeString())
                .font(.largeTitle)
            
            HStack {
                Button(action: {
                    toggleTimer()
                }) {
                    Text(isTimerRunning ? "Pause" : "Start")
                }
                
                Button(action: {
                    resetTimer()
                }) {
                    Text("Reset")
                }
            }}
            ProgressView(value: scaleValue(remainingTime, from: 0.0...1.0*60, to: 0.0...1.0))
                .frame(width: 300, height: 300)
                .progressViewStyle(GaugeProgressStyle())
            
        }
        .onAppear {
            startTimer()
        }
    }
    
    func timeString() -> String {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            
            if isTimerRunning {
                remainingTime -= 1
                withAnimation(){
                    if(elapsed<1)
                    {elapsed+=0.001}
                    else{elapsed=1}
                }
                
                
                if remainingTime <= 0 {
                    stopTimer()
                }
            }
        }
    }
    func scaleValue(_ value: Double, from: ClosedRange<Double>, to: ClosedRange<Double>) -> Double {
        let fromRange = from.upperBound - from.lowerBound
        let toRange = to.upperBound - to.lowerBound
        let scaledValue = (value - from.lowerBound) / fromRange * toRange + to.lowerBound
        return abs(1-scaledValue)
    }
    
    
    func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func toggleTimer() {
        isTimerRunning.toggle()
    }
    
    func resetTimer() {
        remainingTime = 1 * 60
        stopTimer()
    }
}

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.brown
    var strokeWidth = 5.0
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(.yellow, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
        }
    }
}


#Preview {
    countDownView()
}
