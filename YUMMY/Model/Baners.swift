//
//  Baners.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//

import UIKit

struct Baners: Hashable, Decodable {
   
    var imageStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Baners, rhs: Baners) -> Bool {
        return lhs.id == rhs.id
    }
    
//    func contains(filter: String?) -> Bool {
//        guard let filter = filter else { return true }
//        if filter.isEmpty { return true }
//        let lowercasedFilter = filter.lowercased()
//        return username.lowercased().contains(lowercasedFilter)
//    }
}


