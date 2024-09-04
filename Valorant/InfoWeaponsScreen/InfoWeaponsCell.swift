import UIKit

final class InfoWeaponsCell: UITableViewCell {
    
    static let identifer = "InfoWeaponsCell"
    
    private let titleLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.boldSystemFont(ofSize: 16)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    private let valueLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 14)
         label.textColor = .gray
         label.translatesAutoresizingMaskIntoConstraints = false
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
        self.addSubviews(titleLabel,valueLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    func configure(title: String, value: String) {
        titleLabel.text = title
               valueLabel.text = value
    }
}

//Delegate чтобы переавать данные
