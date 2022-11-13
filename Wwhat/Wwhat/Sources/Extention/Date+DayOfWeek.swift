import Foundation

extension Date {
    func DayOfWeek() -> TodayDate {
        let now = Date()
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko_kr")
        date.dateFormat = "EEE"
        let time = date.string(from: now)
        
        switch time {
        case "월": return .월
        case "화": return .화
        case "수": return .수
        case "목": return .목
        case "금": return .금
        default: return .월
        }
    }
}
