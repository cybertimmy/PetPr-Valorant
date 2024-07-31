import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    public func fetchAgents<T: Codable>(completion: @escaping (T?) -> ()) {
        let urlString = "https://valorant-api.com/v1/agents"
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
                let agentResponce = try JSONDecoder().decode(AgentResponce.self, from: data)
                completion(agentResponce.data as? T)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
