//
//  FugitivosTableViewController.swift
//  BountyHunter
//
//  Created by Invitado on 08/10/16.
//  Copyright © 2016 Invitado. All rights reserved.
//

import UIKit

class FugitivosTableViewController: UITableViewController {
    
    //ESTA PROPIEDAD DETEERMINA SI LOS REGISTROS SE VAN A PRESENTAR, 
    @IBAction func btnNuevoTouch(sender: AnyObject) {
        performSegueWithIdentifier("nuevo", sender: self)
    }
    //SI ESTAN CAPTURADOS
    var estaCapturado = 0
    
    var losFugados:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ES NECESARIO INICIALIZAR EL ARRAY, PORQUE NO PUEDE SER NIL
        self.losFugados = NSArray()

        
        //ESTA SE COMENTO PORQUE TRAE TODOS Y LO QUEREMOS CON UNA CONDICION
        //self.losFugados = DBManager.instance.encuentraTodosLos("Fugitive", "Captured")
        
        //tenemos un arreglo de objetos de tipo NSManagedObject que
        //responden al metodo "valueForkEY" PARA CADA UNO DE LOS
        //campos (atributos) definidos en la entidad
        
        /* NO FUNCIONA
         print (losFugados[1].valueForKey("name"))
        print (losFugados[1].valueForKey("desc"))
        print (losFugados[1].valueForKey("bounty"))*/
        
        /*self.losFugados = DBManager.instance.encuentraTodosLos("Fugitive", filtradosPor: NSPredicate(format: "captured=%d", 0))
        */
        
        /* SE QUITO PORQUE SE PUSO EL VIEWDIDAPPEAR
        self.losFugados = DBManager.instance.encuentraTodosLos("Fugitive", filtradosPor: NSPredicate(format: "captured=%d", self.estaCapturado))
        */
        
        //%@ PARA STRINGS
        //LOS QUE NO ESTAN CAPTURADOS ESTAN CON CERO
        //d para enteros
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.cargarTabla()
        
        /*self.losFugados = DBManager.instance.encuentraTodosLos("Fugitive", filtradosPor: NSPredicate(format: "captured=%d", self.estaCapturado))
        
        self.tableView.reloadData()
 */
    }
    
    func cargarTabla(){
        self.losFugados = DBManager.instance.encuentraTodosLos("Fugitive", filtradosPor: NSPredicate(format: "captured=%d", self.estaCapturado))
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.losFugados!.count
    }

    /**/
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let elFugitivo = self.losFugados![indexPath.row] as! Fugitive
        
        //ESTO SE QUITO PORQUE SE AGREGARON LOS ARCHIVOS Fugite.swift y Fugitive+CoreDataProperties
        //cell.textLabel?.text = self.losFugados![indexPath.row].valueForKey("name") as! String
        
        cell.textLabel!.text = elFugitivo.name
        

        return cell
    }
   
    //reuseIdentifier
    

    /**/
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    /**/
    //ENUMERACION (enum) CON VARIOS VALORES .DELETE O .INSERT
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let elFugitivo = self.losFugados![indexPath.row] as! Fugitive
            //ELIMINAR EL OBJETO DEL ARREGLO
            //self.losFugados!.removeAtIndex(indexPath.row)
            
            do{
                //try self.losFugados![indexPath.row].remove()
                //ELIMINAR EL OBJETO DE LA BD
                DBManager.instance.managedObjectContext?.deleteObject(elFugitivo)
                
                try DBManager.instance.managedObjectContext?.save()
                
                // Delete the row from the data source
                //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
                self.cargarTabla()
            }catch{
                print ("No se puede eliminar el objeto del arreglo")
            }
            
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
