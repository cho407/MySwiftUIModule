//탭과 드래그 제스처 예제 코드

import SwiftUI

struct ContentView: View {
    @State private var counterNumber: Int = 0
    
    var numberFontSize: CGFloat {
        get {
            return counterNumber < 50 ? CGFloat(counterNumber + 50) : 150
        }
    }
     
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(counterNumber)")
                .font(.system(size: numberFontSize))
                .bold()
                .frame(width: 300, height: 300)
                .background(Color.purple)
                .foregroundColor(.white)
                .gesture(DragGesture()
                    .onEnded({ value in
                        print("-------------------")
                        print(value.startLocation.y)
                        print(value.location.y)
                        
                        let startY = value.startLocation.y
                        let currentY = value.location.y
                        let gap: CGFloat = 100
                        
                        
                        if startY - currentY > gap {
                            counterNumber += 1
                        } else if currentY - startY > gap  {
                            if counterNumber > 0 {
                                counterNumber -= 1
                            }
                        }
                        
                    })
                    .exclusively(before: TapGesture().onEnded({ _ in
                        counterNumber += 1
                    }))
                )
            
            Spacer()
            
            Button(action: {
                counterNumber = 0
            }) {
                Text("Reset")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}