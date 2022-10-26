// Timer
// SwiftUi기반의 ios 프로그래밍 chapter23

import Foundation
import Combine

class TimerData : ObservableObject{
    @Published var timeCount = 0
    var timer : Timer?
    //timeInterval 에 따라 올라가는 단위 변경
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
 selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    // timeInterval이 끝난후 실행할 행동
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}