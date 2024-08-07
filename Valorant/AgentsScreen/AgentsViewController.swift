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
        setupTitle()
        self.view = agentsView
        agentsView.openInfoAgentsViewControllerDelegate = self
    }
    
    private func setupTitle() {
        navigationItem.title = "Agents"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AgentsViewController: OpenInfoAgentsViewController {
    func openInfoAgentsController() {
        navigationController?.pushViewController(InfoAgentsViewController(), animated: true)
    }
}
