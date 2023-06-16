//
//  UIImageViewExtension.swift
//  Meme
//
//  Created by Tami on 08.03.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imgURL: String ){
        self.kf.setImage(with: URL(string: imgURL))
    }
}
