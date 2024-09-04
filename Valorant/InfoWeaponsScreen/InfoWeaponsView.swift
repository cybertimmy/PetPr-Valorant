import UIKit

final class InfoWeaponsView: UIView {
    
    private let weaponStats: WeaponsStats
    
    init(weaponStats: WeaponsStats) {
        self.weaponStats = weaponStats
        super.init(frame: .zero)
        setupTableView()
        setupBackgroundColor()
        setupApperiance()
    }
    
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InfoWeaponsCell.self, forCellReuseIdentifier: InfoWeaponsCell.identifer)
        return tableView
    }()
    
    
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
}

extension InfoWeaponsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoWeaponsCell.identiferCell, for: indexPath) as? InfoWeaponsCell else {
            fatalError()
        }
        switch indexPath.row {
              case 0:
                  cell.configure(title: "Fire Rate", value: "\(weaponStats.fireRate)")
              case 1:
                  cell.configure(title: "Magazine Size", value: "\(weaponStats.magazineSize)")
              case 2:
                  cell.configure(title: "Run Speed Multiplier", value: "\(weaponStats.runSpeedMultiplier)")
              case 3:
                  cell.configure(title: "Equip Time (Seconds)", value: "\(weaponStats.equipTimeSeconds)")
              case 4:
                  cell.configure(title: "Reload Time (Seconds)", value: "\(weaponStats.reloadTimeSeconds)")
              case 5:
                  cell.configure(title: "First Bullet Accuracy", value: "\(weaponStats.firstBulletAccuracy)")
              case 6:
                  cell.configure(title: "Shotgun Pellet Count", value: "\(weaponStats.shotgunPelletCount)")
              default:
                  break
              }
              return cell
          }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Edd")
    }

