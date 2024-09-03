import UIKit

struct WeaponsResponce: Decodable {
    let data: [Weapons]
}

struct Weapons: Decodable {
    let uuid: String
    let displayName: String
    let displayIcon: String
    let weaponsStats: WeaponsStats?
}

struct WeaponsStats: Decodable {
    let fireRate: Int
    let magazineSize: Int
    let runSpeedMultiplier: Double
    let equipTimeSeconds: Double
    let reloadTimeSeconds: Double
    let firstBulletAccuracy: Double
    let shotgunPelletCount: Int
}

