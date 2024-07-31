import UIKit

final class AgentsViewController: UIViewController {
    
    private let agentsView: AgentsView
    
    init() {
        self.agentsView = AgentsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupTitleVC()
        self.view = agentsView
    }
    
    private func setupTitleVC() {
        navigationItem.title = "Agents"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

