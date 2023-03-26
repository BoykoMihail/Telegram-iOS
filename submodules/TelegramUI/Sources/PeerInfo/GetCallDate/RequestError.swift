//
//  RequestError.swift
//  _idx_AccountContext_5F608943_ios_min11.0
//
//  Created by Mihail Boyko on 3/26/23.
//

import Foundation

enum RequestError: Error {
    case decodeError
    case invalidURL
    case noResponseError
    case unexpectedStatusCode
    case unknownError
}
