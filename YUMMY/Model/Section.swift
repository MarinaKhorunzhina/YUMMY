//
//  Section.swift
//  YUMMY
//
//  Created by Marina on 18.10.22.
//

import Foundation
import UIKit

struct Section: Decodable, Hashable {
    let type: String
    let items: [Baners]
}
