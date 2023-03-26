//
//  URLSessionProtocol.swift
//  _idx_AccountContext_5F608943_ios_min11.0
//
//  Created by Mihail Boyko on 3/26/23.
//

import Foundation

extension URLSession: URLSessionProtocol {}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
