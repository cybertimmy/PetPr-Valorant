import UIKit

final class InfoAgentsView: UIView {
    
    private let titleName: String
    private let descriptionAboutAgent: String
    private let imageAgent: UIImage

    private let titleNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldFont(ofSize: 30)
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .lightFont(ofSize: 20)
        label.numberOfLines = 50
        return label
    }()
    private let agentImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    init(agentName: String, description: String, image: UIImage) {
        self.titleName = agentName
        self.descriptionAboutAgent = description
        self.imageAgent = image
        super.init(frame: .zero)
        self.backgroundColor = UIColor.systemBackground
        setupLabels()
        setupImages()
        setupApperriance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabels() {
        titleNameLabel.text = titleName
        descriptionLabel.text = descriptionAboutAgent
    }
    
    private func setupImages() {
        agentImage.image = imageAgent
        agentImage.contentMode = .scaleAspectFill
    }
    
    private func setupApperriance() {
        self.addSubviews(titleNameLabel,descriptionLabel,agentImage)
        NSLayoutConstraint.activate([
            titleNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            agentImage.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor , constant: 10),
            agentImage.widthAnchor.constraint(equalToConstant: 360),
            agentImage.heightAnchor.constraint(equalToConstant: 360),
        
            
            descriptionLabel.topAnchor.constraint(equalTo: agentImage.bottomAnchor , constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        
        ])
    }
}


