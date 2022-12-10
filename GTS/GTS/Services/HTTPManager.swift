//
//  httpManager.swift
//  GTS
//
//  Created by Khirish Meshram on 10/12/22.
//

import Foundation


struct HttpManager {
    
    func getUsersList(requestUrl: URL, completion: @escaping([UserResults]) -> Void) {
        
        URLSession.shared.dataTask(with: requestUrl) { data, httpUrlResponse, error in
            
            if let responseData = data, responseData.count != 0, error == nil {
                let decoder = JSONDecoder()
                
                do {
                    let data = try decoder.decode(UserResponseData.self, from: responseData)
                    let results = data.results
                    completion(results)
                }
                catch let error {
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
        
    }
}
    
