//
//  PostReq.swift
//  IGSave
//
//  Created by Sameer Qureshi on 2023-05-17.
//

import Foundation

struct PostStruct: Hashable, Codable, Identifiable {
    let url: String
    let base64: String
    var id: String { url }
    
    init(id: String, url: String, base64: String) {
        self.url = url
        self.base64 = base64
    }
}

class ViewModel: ObservableObject{
    
    @Published var Posts: [PostStruct] = []
    
    func postAPI(url: String){
        
        Posts.removeAll()

        let json: [String: String] = ["url": url]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        let url = URL(string: "https://igsave.onrender.com/")!
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
          } catch let error {
            print(error.localizedDescription)
          }

        let task = session.dataTask(with: request){ data, response, error in
            
            if let error = error {
              print("Post Request Error: \(error.localizedDescription)")
              return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server.")
              return
            }
            
            guard let responseData = data else {
              print("NULL data received from the server.")
              return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? Dictionary<String, [Dictionary<String, String>]>{
                    
                var url = ""
                var base64 = ""
           
                if let jsonArr = jsonResponse["links"]{
                    for object in jsonArr{
                        for key in object.keys{
                            if(key == "url"){
                                url = object[key]!
                            }
                            if(key == "base64"){
                                base64 = object[key]!
                            }
                        }
                        self.Posts.append(PostStruct(id: url, url: url, base64: base64))
                    }
                }
        
              } else {
                print("Data maybe corrupted or in wrong format.")
                throw URLError(.badServerResponse)
              }
            } catch let error {
              print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

