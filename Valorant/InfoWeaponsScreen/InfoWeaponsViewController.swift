import UIKit

final class InfoWeaponsViewController: UIViewController {
    
    private let infoWeaponsView: InfoWeaponsView
    
    init() {
        self.infoWeaponsView = InfoWeaponsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = infoWeaponsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
