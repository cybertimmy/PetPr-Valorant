import UIKit

final class AgentsView: UIView {
    
    private var agents: [Agent] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    weak var openInfoAgentsViewControllerDelegate: OpenInfoAgentsViewController?

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AgentsCell.self, forCellWithReuseIdentifier: AgentsCell.identifer)
        collectionView.backgroundColor = .systemBackground
        collectionView.layer.cornerRadius = 8
        collectionView.layer.shadowOffset = CGSize(width: -4, height: 4)
        collectionView.layer.shadowOpacity = 0.3
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fetchAgents()
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

extension AgentsView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        agents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgentsCell.identifer, for: indexPath) as? AgentsCell else {
            fatalError()
        }
        let agent = agents[indexPath.row]
        cell.configure(agent: agent)
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
        openInfoAgentsViewControllerDelegate?.openInfoAgentsController()
    }
}

extension AgentsView {
    private func fetchAgents() {
        NetworkManager.shared.getData(url: .agentsURL, modelForParsing: AgentResponce.self) { [weak self] agents in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.agents = agents?.data ?? []
            }
        }
    }
}
