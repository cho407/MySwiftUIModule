import Foundation

// playground에서 URLSession 통신하려면 다음의 코드가 필요하다
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct CovidCenters: Codable {
    var currentCount: Int
    var data: [CovidCenter]
    var matchCount: Int
    var page: Int
    var perPage: Int
    var totalCount: Int
}

struct CovidCenter: Codable {
    var address: String
    var centerName: String
    var centerType: String
    var sido: String
}

func loadJson<T: Decodable>(data: Data) -> T {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse data: \(error)")
    }
}

let url = URL(string:"https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=10&serviceKey=IqV8U3oL39Xq5A1gSbKYKHnRESAPgGu397bHbKxmiAlqiHoR1Zkf5yNLne8Xtc%2B9MEt8XKceRDvE%2F%2Bu4%2Fn6rbQ%3D%3D")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    guard let data else {
        print("data - not found")
        return
    }
    
    let dataToString = String(data: data, encoding: .utf8)!
    print("\(dataToString)")
    
    let centers: CovidCenters = loadJson(data: data)
    print("\(centers)")
    print("currentCount: \(centers.currentCount)")
    print("matchCount : \(centers.matchCount)")
    
    let centerList = centers.data
    
    for center in centerList {
        print("\(center.centerName)")
        print("\(center.sido)")
        print("\(center.address)")
        print("\(center.centerType)")
        print("------------------------")
    }
}

task.resume()