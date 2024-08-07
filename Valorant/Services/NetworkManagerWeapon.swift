import UIKit


final class NetworkManagerWeapon {
    
    static let shared = NetworkManagerWeapon()
    
    public func fetchWeapons<T: Codable>(completion: @escaping (T?) -> ()) {
        let urlString = "https://valorant-api.com/v1/weapons"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   print("Error fetching agents: \(error)")
                   completion(nil)
                   return
               }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let weaponsResponce = try JSONDecoder().decode(WeaponsResponce.self, from: data)
                completion(weaponsResponce.data as? T)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
