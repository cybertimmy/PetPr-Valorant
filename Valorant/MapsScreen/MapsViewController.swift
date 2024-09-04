import UIKit

final class MapsViewController: UIViewController {
    
    private let mapsView: MapsView
    
    init() {
        self.mapsView = MapsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = mapsView
        setupTitle()
    }
    
    private func setupTitle() {
        navigationItem.title = "Maps"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
