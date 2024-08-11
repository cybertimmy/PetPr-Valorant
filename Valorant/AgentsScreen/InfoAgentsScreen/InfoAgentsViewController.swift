import UIKit

final class InfoAgentsViewController: UIViewController {
    
    private let infoAgentsView: InfoAgentsView
    //4.Создаем чтобы инициализтор принимал это как параметр
    private let titleName: String
    
    init(agentName: String) {
        self.titleName = agentName
        self.infoAgentsView = InfoAgentsView(agentName:titleName)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = infoAgentsView
        setupAppereance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    private func setupAppereance() {
    }
}
