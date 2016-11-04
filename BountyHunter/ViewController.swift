//
//  ViewController.swift
//  BountyHunter
//
//  Created by Invitado on 01/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for fontFamilyName in UIFont.familyNames(){
            print (fontFamilyName)
            for fontName in UIFont.fontNamesForFamilyName(fontFamilyName){
                print ("\t\(fontName)")
            }
        }
        
        //ordenadosPor es una etiqueta, que se puede cambiar por _ (guion bajo y espacio)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

