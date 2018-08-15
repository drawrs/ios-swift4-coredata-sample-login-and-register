//
//  ViewController.swift
//  CoreDataLagi
//
//  Created by Rizal Hilman on 15/08/18.
//  Copyright © 2018 Rizal Hilman. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//        newUser.setValue("admin", forKey: "username")
//        newUser.setValue("admin5", forKey: "password")
//        newUser.setValue("20", forKey: "age")
//
//        newUser.setValue("asep admin", forKey: "fullname")
//        do {
//            try context.save()
//            print("Berhasil")
//        } catch {
//            print("Failed saving")
//        }
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "username = %@", "admin")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let username = data.value(forKey: "username") as! String
                let password = data.value(forKey: "password") as! String
                
                if username == "admin" && password == "admin5" {
                    print("Login berhasil")
                } else {
                    print("Login gagal")
                }
            }
            
        } catch {
            
            print("Failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

