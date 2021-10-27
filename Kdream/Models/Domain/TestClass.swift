//
//  TestClass.swift
//  Kdream
//
//  Created by Kasatin on 26.10.2021.
//

import Foundation


struct MuyClass: SProtocol{
    var isUpdate: Bool
    
    var name: String
    var year: Int
}

protocol SProtocol{
    var isUpdate: Bool { get set }
}
