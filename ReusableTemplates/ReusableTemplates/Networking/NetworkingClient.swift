//
//  NetworkingClient.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/19/21.
//

import Foundation



public class NetworkingClient{
    let session : URLSession
    let config : URLSessionConfiguration
    
    init() {
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func fetchPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
            return
        }
        let request = URLRequest(url: url)
        genericNetworkRequest(request) { result in
            switch result{
            case .success(let data):
                print(data)
                
            case .failure(let error):
                print("error : \(error.localizedDescription)")
            }
            
        }
    }
    
    func genericNetworkRequest(_ urlReq : URLRequest,_ completion : @escaping (Result<ManualDecodingStruct, NetworkError>) -> Void){
        session.dataTask(with: urlReq) { data, resp, err in
            if let error = err {
                completion(.failure(.transportError(error)))
                return
            }
            
            if let response = resp as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.serverError(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            

            
        }
        
        
    }
}

internal enum NetworkError: Error {
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
}


extension NetworkError {
    
    init?(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            self = .transportError(error)
            return
        }

        if let response = response as? HTTPURLResponse,
            !(200...299).contains(response.statusCode) {
            self = .serverError(statusCode: response.statusCode)
            return
        }
        
        if data == nil {
            self = .noData
        }
        
        return nil
    }
}
