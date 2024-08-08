import Foundation
import UIKit

struct AgentResponce: Decodable {
    let data: [Agent]
}

struct Agent: Decodable {
    let uuid: String
    let displayName: String
    let description: String
    let displayIcon: String
}
