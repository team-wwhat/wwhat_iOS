import Foundation

enum TodayDate {
    case 월, 화, 수, 목, 금
    
    func toNum() -> String {
        switch self {
        case .월: return "0"
        case .화: return "1"
        case .수: return "2"
        case .목: return "3"
        case .금: return "4"
        }
    }
}
