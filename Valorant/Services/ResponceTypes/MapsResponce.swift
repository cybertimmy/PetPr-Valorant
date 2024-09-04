import UIKit

struct MapsResponce: Decodable {
    let data: [Maps]
}

struct Maps: Decodable {
    let uuid: String
    let displayName: String
    let listViewIcon: String
}
