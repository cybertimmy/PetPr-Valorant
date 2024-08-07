import Foundation

final class Constants {
    static let agentsID = "https://valorant-api.com/v1/agents"
    static let weaponsID = "https://valorant-api.com/v1/weapons"
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    public func fetchAgents<T: Codable>(completion: @escaping (T?) -> ()) {
        guard let url = URL(string: Constants.agentsID) else {
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
                let agentResponce = try JSONDecoder().decode(AgentResponce.self, from: data)
                completion(agentResponce.data as? T)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
    
    public func fetchWeapons<T: Codable>(completion: @escaping (T?) -> ()) {
        guard let url = URL(string: Constants.weaponsID) else {
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
