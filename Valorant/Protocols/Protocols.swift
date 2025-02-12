import UIKit

protocol OpenAgentsViewController: AnyObject {
    func openAgentsViewController()
}

protocol OpenWeaponsViewController: AnyObject {
    func openWeaponsViewController()
}

protocol OpenMapsViewController: AnyObject {
    func openMapsViewController()
}

//1.Создали протокол
protocol OpenInfoAgentsViewController: AnyObject {
    func openInfoAgentsViewController(title: String, description: String, imageAgent: UIImage)
}

protocol OpenInfoWeaponsViewController: AnyObject {
    func openInfoWeaponsViewController()
}
