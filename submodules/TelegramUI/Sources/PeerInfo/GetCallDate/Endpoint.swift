//
//  Endpoint.swift
//  _idx_AccountContext_5F608943_ios_min11.0
//
//  Created by Mihail Boyko on 3/26/23.
//

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [String: String]? { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var method: Method { get }
}

extension Endpoint {
    var baseURL: String {
        return "http://worldtimeapi.org/"
    }
}
