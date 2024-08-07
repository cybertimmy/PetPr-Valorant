import UIKit

struct WeaponsResponce: Codable {
    let data: [Weapons]
}

struct Weapons: Codable {
    let uuid: String
    let displayName: String
    let displayIcon: String
}

