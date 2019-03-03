//
//  CardTableViewController.swift
//  Car List
//
//  Created by Лёха on 02/03/2019.
//  Copyright © 2019 Moorzeen. All rights reserved.
//

import UIKit
import CoreData

class CarsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    @IBAction func AddCar(_ sender: Any) {
                performSegue(withIdentifier: "carsToCar", sender: nil)
    }
    
    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "Car", keyForSort: "manufacturer")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = fetchedResultsController.object(at: indexPath) as! Car
        let cell = UITableViewCell()
        cell.textLabel?.text = car.manufacturer
        return cell
    }
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = fetchedResultsController.object(at: indexPath as IndexPath) as? Car
        performSegue(withIdentifier: "carsToCar", sender: car)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "carsToCar" {
            let controller = segue.destination as! CarViewController
            controller.car = sender as? Car
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let managedObject = fetchedResultsController.object(at: indexPath) as! NSManagedObject
            CoreDataManager.instance.context.delete(managedObject)
            CoreDataManager.instance.saveContext()
        }
    }

    
    // MARK: - Fetched Results Controller Delegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            case .insert:
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .automatic)
                }
            case .update:
                if let indexPath = indexPath {
                    let car = fetchedResultsController.object(at: indexPath) as! Car
                    let cell = tableView.cellForRow(at: indexPath)
                    cell!.textLabel?.text = car.manufacturer
                }
            case .move:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
                if let newIndexPath = newIndexPath {
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            case .delete:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}
