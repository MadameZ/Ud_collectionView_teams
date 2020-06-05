//
//  UIViewExtension.swift
//  collectionView_team
//
//  Created by Caroline Zaini on 04/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

extension UIView {
    
    func setupGradient(_ colors: [CGColor]) {
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.locations = [0, 0.5]
        // les bounds de notre vue
        gradient.frame = self.bounds
        // at: 0 -> position 0 donc tout au fond
        layer.insertSublayer(gradient, at: 0)
    }
    
    func circleView(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func shadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
}
