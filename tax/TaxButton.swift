//
//  TaxButton.swift
//  tax
//
//  Created by Ahmed Ghareeb on 2019-06-06.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import UIKit

@IBDesignable
class TaxButton: UIButton {
    
    var label = UILabel()
    
    override func draw(_ rect: CGRect) {

        let size = CGFloat(40)
        let imageFrame: CGRect = CGRect(x: 5, y: (frame.size.height/2) - size/2, width: size+10, height: size)
        let imageView = UIImageView(frame: imageFrame)

        imageView.image = UIImage(named: "canada_flag")
        addSubview(imageView)
    }


}
