import UIKit

protocol OpenAgentsViewController: AnyObject {
    func openAgentsViewController()
}

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
        homeView.openAgentsViewControllerDelegate = self
        setupTitle()
    }
    
    private func setupTitle() {
        navigationItem.title = "Home"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: OpenAgentsViewController {
    func openAgentsViewController() {
        navigationController?.pushViewController(AgentsViewController(), animated: true)
    }
}
