import UIKit

final class HomeCell: UICollectionViewCell {
    
    static let identifer = "HomeCell"
    
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
        
    public func title(title: String) {
        nameLabel.text = title
    }
    
    private func setupApperiance() {
        self.addSubviews(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}

