import UIKit

final class InfoAgentsViewController: UIViewController {
    
    var ability: Abilities?
    
    private let infoAgentsView: InfoAgentsView
    //4.Создаем чтобы инициализтор принимал это как параметр
    private let titleName: String
    private let descriptionAgent: String
    private let agentImage: UIImage
    
    init(agentName: String, description: String, image: UIImage) {
        self.titleName = agentName
        self.descriptionAgent = description
        self.agentImage = image
        self.infoAgentsView = InfoAgentsView(agentName: titleName, description: descriptionAgent, image: image)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = infoAgentsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

