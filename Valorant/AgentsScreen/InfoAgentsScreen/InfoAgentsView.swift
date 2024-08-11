import UIKit

final class InfoAgentsView: UIView {
    
    private var titleName: String
    
    init(agentName: String) {
        self.titleName = agentName
        super.init(frame: .zero)
        self.backgroundColor = UIColor.systemBackground
        setupApperriance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupApperriance() {
        self.addSubviews()
        let label = UILabel()
        label.text = titleName
        label.font = UIFont.systemFont(ofSize: 70)
        self.addSubviews(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
}


