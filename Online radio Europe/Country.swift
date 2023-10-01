//
//  Country.swift
//  Online radio Europe
//
//  Created by Elena Moga on 2023-06-19.
//

import Foundation

class Country {
    
    var name: String
    var radios: [Radio]
    
    init(name: String, radios: [Radio]) {
        self.name = name
        self.radios = radios
    }
}
