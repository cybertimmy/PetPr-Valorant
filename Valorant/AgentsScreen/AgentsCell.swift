import UIKit

final class AgentsCell: UICollectionViewCell {
    
    static let identifer = "AgentsCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldFont(ofSize: 20)
        return label
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleCell()
        setupApperiance()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleCell() {
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 6
        contentView.layer.masksToBounds = false
    }
    
    private func setupApperiance() {
        self.addSubviews(imageView,nameLabel)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    func configure(agent: Agent) {
        nameLabel.text = agent.displayName
        LoadImage.shared.loadImage(from: agent.displayIcon) { [weak self] image  in
            self?.imageView.image = image
            self?.imageView.contentMode = .scaleAspectFit
        }
    }
}

