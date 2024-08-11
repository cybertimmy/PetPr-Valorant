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
        agentsView.openInfoAgentsViewControllerDelegate = self
        self.view = agentsView
        setupTitle()
    }
    
    private func setupTitle() {
        navigationItem.title = "Agents"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//2. Подписываемся на протокол
//3.Реализовать String в другом контроллере

extension AgentsViewController: OpenInfoAgentsViewController {    
    func openInfoAgentsController(title: String) {
        //5. Передать title
        navigationController?.pushViewController(InfoAgentsViewController(agentName: title), animated: true)
    }
}




