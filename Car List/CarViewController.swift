//
//  CarViewController.swift
//  Car List
//
//  Created by Лёха on 03/03/2019.
//  Copyright © 2019 Moorzeen. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        if saveCustomer() {
            dismiss(animated: true, completion: nil)
        }
    }
    
    var car: Car?
    
    @IBOutlet weak var manufacturer: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var bodyType: UITextField!
    @IBOutlet weak var carClass: UITextField!
    @IBOutlet weak var year: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let car = car {
            manufacturer.text = car.manufacturer
            model.text = car.model
            bodyType.text = car.bodyType
            carClass.text = car.carClass
            year.text = String(car.year)
        }
    }
    
    func saveCustomer() -> Bool {
        // Validation of required fields
        if manufacturer.text!.isEmpty {
            let alert = UIAlertController(title: "Что-то не так", message: "Укажите производителя", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        // Creating object
        if car == nil {
            car = Car()
        }
        // Saving object
        if let car = car {
            car.manufacturer = manufacturer.text
            car.model = model.text
            car.bodyType = bodyType.text
            car.carClass = carClass.text
            car.year = Int16(year.text!) ?? 0
            CoreDataManager.instance.saveContext()
        }
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
