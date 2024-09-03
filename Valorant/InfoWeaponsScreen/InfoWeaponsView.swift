import UIKit

final class InfoWeaponsView: UIView {
    
    private var weaponsStats: [WeaponsStats] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InfoWeaponsCell.self, forCellReuseIdentifier: InfoWeaponsCell.identifer)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateWeaponsStats(with: weaponsStats)
        setupTableView()
        setupBackgroundColor()
        setupApperiance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupBackgroundColor() {
        self.backgroundColor = UIColor.systemBackground
    }
    
    private func setupApperiance() {
        self.addSubviews(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func updateWeaponsStats(with stats: [WeaponsStats]) {
        self.weaponsStats = stats
        print("WeaponsStats count: \(weaponsStats.count)")
    }
}

extension InfoWeaponsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weaponsStats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoWeaponsCell.identiferCell, for: indexPath) as? InfoWeaponsCell else {
            fatalError()
        }
        let weaponStats = weaponsStats[indexPath.row] // Получаем объект WeaponsStats
        print("Configuring cell at index \(indexPath.row) with stats: \(weaponStats)") // Логирование объекта WeaponsStats
        cell.configure(stats: weaponStats) // Передаем весь объект в метод configure
        // Настраиваем текст метки на основе fireRate
        cell.textLabel?.text = String(weaponStats.fireRate)
        return cell
    }
}

