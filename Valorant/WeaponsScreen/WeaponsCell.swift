import UIKit

final class WeaponsCell: UICollectionViewCell {
    
    static let identifer = "WeaponsCell"

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
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func configure(weapons: Weapons) {
        nameLabel.text = weapons.displayName
        LoadImage.shared.loadImage(from: weapons.displayIcon) { [weak self] image in
            self?.imageView.image = image
            self?.imageView.contentMode = .scaleAspectFit
        }
    }
}

