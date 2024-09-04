import UIKit

final class WeaponsViewController: UIViewController {
    
    private let weaponView: WeaponsView
    
    init() {
        self.weaponView = WeaponsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view = weaponView
        setupTitle()
        setupDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
    }
    
    private func setupTitle() {
        navigationItem.title = "Weapons"
    }
    
    private func setupDelegate() {
        weaponView.openInfoWeaponsViewControllerDelegate = self
    }
}

extension WeaponsViewController: OpenInfoWeaponsViewController {
    func openInfoWeaponsViewController(weaponStats: WeaponsStats) {
        navigationController?.pushViewController(InfoWeaponsViewController(weaponsStats: weaponStats), animated: true)
    }
}
