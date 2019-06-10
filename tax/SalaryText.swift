//
//  SalaryText.swift
//  tax
//
//  Created by Ahmed Ghareeb on 2019-06-06.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import UIKit

@IBDesignable
class SalaryText: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 30
        let labelFrame: CGRect = CGRect(x: 5, y: (frame.size.height/2) - size/2, width: size, height: size)
        let label = UILabel(frame: labelFrame)
        label.backgroundColor = #colorLiteral(red: 0.5723067522, green: 0.5723067522, blue: 0.5723067522, alpha: 0.3288127201)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1741406024, green: 0.1741406024, blue: 0.1741406024, alpha: 1)
        label.layer.cornerRadius = 30.0
        
        let dollarSign = NumberFormatter()
        dollarSign.numberStyle = .currency
        
        label.text = dollarSign.currencySymbol
        label.clipsToBounds = true
        addSubview(label)
        
    }
    
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
        
        //put anything for the place holder so it won't be null and the app crashes
        if placeholder == nil{
            placeholder = " "
        }
        
        //change the placeHolder color
        let place = NSAttributedString(string: placeholder!, attributes: [ .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        attributedPlaceholder = place
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
}
