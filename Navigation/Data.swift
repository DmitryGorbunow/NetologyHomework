//
//  Data.swift
//  Navigation
//
//  Created by Dmitry Gorbunow on 12/8/22.
//

import Foundation
import UIKit

class Photos {
    var photos: [UIImage] = []
    
    func appendPhotos() {
        for i in 1...21 {
            photos.append(UIImage(named: "\(i)") ?? UIImage())
        }
    }
    
    init() {
        appendPhotos()
    }
}
