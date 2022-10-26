import SwiftUI

struct ContentView: View {
    @State private var wifiEnable: Bool = false
    @State private var userName: String = ""
    
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnable) {
                Text("Wi-Fi 가능한가요?")
            }
            .toggleStyle(SwitchToggleStyle(tint:.blue
                                          ))
            TextField("이름을 입력하세요", text: $userName)
            Text(userName)
            
            Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
                .foregroundColor(wifiEnable ? Color.blue : Color.red)
            Text(wifiEnable ? "Wi-Fi켜짐" : "Wi-Fi 꺼짐")
        }
        .padding()
        .font(.largeTitle)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}