//
//  SelfConfiguringCell.swift
//  YUMMY
//
//  Created by Marina on 13.10.22.
//

import Foundation


protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
