import Foundation
import UIKit

struct AgentResponce: Codable {
    let data: [Agent]
}

struct Agent: Codable {
    let uuid: String
    let displayName: String
    let description: String
    let displayIcon: String
}
