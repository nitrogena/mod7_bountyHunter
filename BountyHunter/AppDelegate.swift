//
//  AppDelegate.swift
//  BountyHunter
//
//  Created by Invitado on 01/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //COPIAR LA BD QUE SE AGREGO COMO RECURSO, A LA UBICACION DOCUMENTS
        
        //1. ENCONTRAR UBICACION DE UN RECURSO
        let origen = NSBundle.mainBundle().pathForResource("BountyHunter", ofType: "sqlite")
        
        //2. OBTENER LA UBICACION DE DESTINO
        let destino = DBManager.instance.directorioDocuments.URLByAppendingPathComponent("BountyHunter.sqlite")
        //TOMA UN STRING Y LO PEGA CON LA DIAGONAL CORRECTA, ES UNA URL
        
        //3. VALIDAR SI LA BD NO EXISTE EN EL DESTINO
        //con objeto file manager
        if NSFileManager.defaultManager().fileExistsAtPath(destino.path!){
            return true
        }
        else{
            do{
                //4. COPIA LA BD ORIGEN AL DESTINO
                try NSFileManager.defaultManager().copyItemAtPath(origen!, toPath: destino.path!)
            }
            catch{
                print("ya valio")
                abort()
            }
        }
        return true
        
        
    }

    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

