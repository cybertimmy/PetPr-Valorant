import UIKit

final class AbilityPresentationViewController: UIViewController {
    
    private let abilityView: AbilityView
    
    init() {
        self.abilityView = AbilityView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = abilityView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
