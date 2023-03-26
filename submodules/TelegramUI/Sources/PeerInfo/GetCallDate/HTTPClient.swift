//
//  HTTPClient.swift
//  _idx_AccountContext_5F608943_ios_min11.0
//
//  Created by Mihail Boyko on 3/26/23.
//

import Foundation

protocol HTTPClient {
    var urlSession: URLSessionProtocol { get }
    
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type,
                                   completion: @escaping (T?, RequestError?) -> Void)
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type,
                                   completion: @escaping (T?, RequestError?) -> Void) {
        guard var components = URLComponents(string: endpoint.baseURL + endpoint.path) else {
            completion(nil, RequestError.invalidURL)
            return
        }

        components.queryItems = endpoint.queryItems?.map({ (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        })

        guard let url = components.url else {
            completion(nil, RequestError.invalidURL)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
                
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(nil, RequestError.unknownError)
                return
            }
            
            guard let response = response as? HTTPURLResponse, let data else {
                completion(nil, RequestError.noResponseError)
                return
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    completion(nil, RequestError.decodeError)
                    return
                }
                completion(decodedResponse, nil)
            default:
                completion(nil, RequestError.unexpectedStatusCode)
            }
        }
        
        dataTask.resume()
    }
}
