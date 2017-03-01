//
//  KIFTestActor.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 7/2/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation
import KIF

extension KIFTestActor {
    func tester(_ file: String = #file, line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(_ file: String = #file, line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

