import Foundation

struct ScheduleModel: Codable {
    let the7교시, the6교시, the4교시, the2교시: String
    let the3교시, the1교시, the5교시: String

    enum CodingKeys: String, CodingKey {
        case the7교시 = "7교시"
        case the6교시 = "6교시"
        case the4교시 = "4교시"
        case the2교시 = "2교시"
        case the3교시 = "3교시"
        case the1교시 = "1교시"
        case the5교시 = "5교시"
    }
}
