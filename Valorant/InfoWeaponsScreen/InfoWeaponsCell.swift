import UIKit

final class InfoWeaponsCell: UITableViewCell {
    
    static let identifer = "InfoWeaponsCell"
    
    private let statsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.numberOfLines = 10
        return label
    }()
    
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupApperiance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupApperiance() {
        self.addSubviews(statsLabel)
        NSLayoutConstraint.activate([
            statsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            statsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            statsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            statsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
    }
    
    func configure(stats: WeaponsStats) {
        statsLabel.text = String(stats.fireRate)
    }
}

