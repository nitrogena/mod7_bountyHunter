//
//  Fugitive+CoreDataProperties.swift
//  BountyHunter
//
//  Created by Invitado on 08/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Fugitive {

    @NSManaged var captured: Bool
    @NSManaged var fugitiveID: Int16
    @NSManaged var captdate: NSTimeInterval
    @NSManaged var capturedLat: Double
    @NSManaged var capturedLon: Double
    @NSManaged var bounty: NSDecimalNumber?
    @NSManaged var desc: String?
    @NSManaged var name: String?
    @NSManaged var image: NSData?
    
    //PROPIEDADES ADMINISTRADAS, 
    //TRAERA LA INFORMACION HASTA QUE SEA NECESARIO TRAERLA
    //POR ESO COMIENZAN CON NSManaged

}
