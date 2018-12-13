//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by timofey makhlay on 12/5/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//
import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
