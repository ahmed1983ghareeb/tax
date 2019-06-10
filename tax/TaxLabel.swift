//
//  TaxLabel.swift
//  tax
//
//  Created by Ahmed Ghareeb on 2019-06-06.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import UIKit

@IBDesignable
class TaxLabel: UILabel {
    
    override func prepareForInterfaceBuilder() {
        //this function is called for render in storyBoard view (xcode) u nead to add @IBDesignable
        //so you can see the changes in your storyBoard before running the app
        customRender()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customRender()
    }
    
    func customRender(){
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2139084507)
        //the layer is resposible for the border
        layer.cornerRadius = 10
        
        textAlignment = .center
    
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
    }
}
