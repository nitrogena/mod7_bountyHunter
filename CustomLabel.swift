//
//  CustomLabel.swift
//  BountyHunter
//
//  Created by Invitado on 01/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    

    /**/    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    //VAMOS A "DIBUJAR" LA FUENTE
    override func drawRect(rect: CGRect) {
        
        self.font = UIFont(name: "Champagne&Limousines-Bold", size: Constantes.FUENTE_TITULOS)
        //SE PUSO EL SUPER ABAJO PORQUE SI LO DEJAMOS ARRIBA, SE VA A RENDEREAR CON LA FUENTE DEL SISTEMA
        
        self.backgroundColor = Constantes.COLOR_ETIQUETAS
        //el layer se puede colocar en el background color
        self.layer.cornerRadius = rect.size.height / 3
        self.textColor = Constantes.COLOR_TEXTOS
        super.drawRect(rect)
    }
    /**/

}
