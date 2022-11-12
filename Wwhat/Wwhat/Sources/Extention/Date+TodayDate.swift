import Foundation

extension Date {
    func TodayDate() -> String {
        let now = Date()
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko_kr")
        date.dateFormat = "MM월 dd일 EEE"
        
        let time = date.string(from: now)
        return time
    }
}
