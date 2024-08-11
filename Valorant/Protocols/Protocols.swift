import UIKit

protocol OpenAgentsViewController: AnyObject {
    func openAgentsViewController()
}

protocol OpenWeaponsViewController: AnyObject {
    func openWeaponsViewController()
}

//1.Создали протокол
protocol OpenInfoAgentsViewController: AnyObject {
    func openInfoAgentsController(title: String)
}
