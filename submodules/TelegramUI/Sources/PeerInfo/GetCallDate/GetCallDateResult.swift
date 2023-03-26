//
//  GetCallDateResult.swift
//  _idx_AccountContext_5F608943_ios_min11.0
//
//  Created by Mihail Boyko on 3/26/23.
//

struct GetCallDateResult: Codable {
    let unixtime: Int32

    enum CodingKeys: String, CodingKey {
        case unixtime
    }

    init(unixtime: Int32) {
        self.unixtime = unixtime
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(unixtime, forKey: .unixtime)
    }
}
