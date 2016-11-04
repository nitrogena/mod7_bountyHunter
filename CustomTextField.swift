//
//  CustomTextField.swift
//  BountyHunter
//
//  Created by Invitado on 01/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawRect(rect: CGRect) {
        
        self.font = UIFont(name: "Champagne&Limousines", size: Constantes.FUENTE_TEXTO)
        
        
        
        //SE PUSO EL SUPER ABAJO PORQUE SI LO DEJAMOS ARRIBA, SE VA A RENDEREAR CON LA FUENTE DEL SISTEMA
        
        self.layer.backgroundColor = UIColor.blackColor().CGColor
        
        self.backgroundColor = UIColor.blackColor()
       
        self.layer.cornerRadius = rect.size.height / 3
        self.textColor = UIColor.whiteColor()
        super.drawRect(rect)
        
        //placeholder
        let atributos = [NSForegroundColorAttributeName: UIColor.lightGrayColor(), NSFontAttributeName: UIFont(name: "Champagne&Limousines-Bold", size: 18.0)!]
        var placeholderOriginal = self.placeholder
        if placeholderOriginal == nil{
            placeholderOriginal = ""
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderOriginal!, attributes: atributos)
    }


}
