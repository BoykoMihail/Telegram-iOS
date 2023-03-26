//
//  GetCallDateService.swift
//  _idx_AccountContext_5F608943_ios_min11.0
//
//  Created by Mihail Boyko on 3/26/23.
//

import Foundation

final class GetCallDateService: HTTPClient, IGetCallDateService {
    let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchCallDate(completion: @escaping (GetCallDateResponse?, Error?) -> Void) {

        return sendRequest(endpoint: CallDateEndpoint.getDate,
                           responseModel: GetCallDateResult.self) { response, error in
            if let error {
                completion(nil, error)
                return
            }
            
            guard let response else {
                completion(nil, RequestError.noResponseError)
                return
            }
            
            completion(response, nil)
        }
    }
}
