//
//  CallDateEndpoint.swift
//  _idx_AccountContext_5F608943_ios_min11.0
//
//  Created by Mihail Boyko on 3/26/23.
//

import Foundation

enum CallDateEndpoint {
    case getDate
}

extension CallDateEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getDate:
            return "api/timezone/Europe/Moscow"
        }
    }

    var queryItems: [String: String]? {
        switch self {
        case .getDate:
            return nil
        }
    }

    var header: [String: String]? {
        switch self {
        case .getDate:
            return nil
        }
    }

    var body: [String: String]? {
        switch self {
        case .getDate:
            return nil
        }
    }

    var method: Method {
        switch self {
        case .getDate:
            return .get
        }
    }
}
