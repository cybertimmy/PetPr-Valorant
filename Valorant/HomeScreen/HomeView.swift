import UIKit

final class HomeView: UIView {
    
    weak var openAgentsViewControllerDelegate: OpenAgentsViewController?
    weak var openWeaponsViewControllerDelegate: OpenWeaponsViewController?
    
    private let arrayImage: [UIImage] = [.image1!, .image2!]
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifer)
        collectionView.backgroundColor = .systemBackground
        collectionView.layer.cornerRadius = 8
        collectionView.layer.shadowOffset = CGSize(width: -4, height: 4)
        collectionView.layer.shadowOpacity = 0.3
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupApperiance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupApperiance() {
        self.addSubviews(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifer, for: indexPath) as? HomeCell else {
            fatalError()
        }
        let images = arrayImage[indexPath.row]
        switch indexPath.item  {
        case 0: cell.congigure(image: images)
                cell.title(title: "Agents")
        case 1: cell.congigure(image: images)
                cell.title(title: "Weapons")
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0: openAgentsViewControllerDelegate?.openAgentsViewController()
        case 1: openWeaponsViewControllerDelegate?.openWeaponsViewController()
        default:
            break
        }
    }
}

