import UIKit

final class HomeViewController: UIViewController {
        
    private let homeView: HomeView

    init() {
        self.homeView = HomeView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeView
        setupDelegates()
        setupTitle()
    }
    
    private func setupTitle() {
        navigationItem.title = "Home"
    }
    
    private func setupDelegates() {
        homeView.openAgentsViewControllerDelegate = self
        homeView.openWeaponsViewControllerDelegate = self
        homeView.openMapsViewControllerDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: OpenAgentsViewController, OpenWeaponsViewController, OpenMapsViewController {
    func openMapsViewController() {
        navigationController?.pushViewController(MapsViewController(), animated: true)
    }
    
    func openAgentsViewController() {
        navigationController?.pushViewController(AgentsViewController(), animated: true)
    }
    
    func openWeaponsViewController() {
        navigationController?.pushViewController(WeaponsViewController(), animated: true)
    }
}
