import UIKit

final class InfoAgentsViewController: UIViewController {
    
    private let infoAgentsView: InfoAgentsView
    //4.Создаем чтобы инициализтор принимал это как параметр
    private let titleName: String
    private let descriptionAgent: String
    private let agentImage: UIImage
    
    init(agentName: String, description: String, image: UIImage) {
        self.titleName = agentName
        self.descriptionAgent = description
        self.agentImage = image
        self.infoAgentsView = InfoAgentsView(agentName:titleName, description: descriptionAgent, image: image)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = infoAgentsView
        goToAbilityPresentationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func goToAbilityPresentationController() {
        infoAgentsView.abilityButton.addTarget(self, action: #selector(abilityPresentationController), for: .touchUpInside)
    }
}

extension InfoAgentsViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return AbilityPresentation(presentedViewController: presented, presenting: presenting)
    }
}

extension InfoAgentsViewController {
    @objc func abilityPresentationController() {
        let abilityPresentationScreen = AbilityPresentationViewController()
        abilityPresentationScreen.modalPresentationStyle = .pageSheet
        abilityPresentationScreen.sheetPresentationController?.prefersGrabberVisible = true
        abilityPresentationScreen.transitioningDelegate = self
        present(abilityPresentationScreen, animated: true)
    }
}
