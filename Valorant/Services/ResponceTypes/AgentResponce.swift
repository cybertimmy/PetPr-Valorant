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
    let fullPortrait: String
    let background: String
    let abilities: [Abilities]
}

struct Abilities: Decodable {
    let slot: String
    let displayName: String
    let description: String
}
