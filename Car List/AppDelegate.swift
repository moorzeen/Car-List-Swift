//
//  AppDelegate.swift
//  Car List
//
//  Created by Лёха on 02/03/2019.
//  Copyright © 2019 Moorzeen. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        preloadData()
        return true
    }
    
    private func preloadData() {
        
        let preloadedDataKey = "didPreloadData"
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: preloadedDataKey) == false {
            // Preload
            guard let urlPath = Bundle.main.url(forResource: "PreloadedData", withExtension: "plist") else {
                return
            }
            
            let backgroundContext = CoreDataManager.instance.persistentContainer.newBackgroundContext()
            CoreDataManager.instance.context.automaticallyMergesChangesFromParent = true
            backgroundContext.perform {
                if let arrayContents = NSArray(contentsOf: urlPath) as? [String] {
                    do {
                        
                        
                        
                        for carBrand in arrayContents {
                            let carObject = Car(context: backgroundContext)
                            carObject.manufacturer = carBrand
                        }
                        try backgroundContext.save()
                        userDefaults.set(true, forKey: preloadedDataKey)
                        
                    } catch {
                        print(error.localizedDescription )
                    }
                    
                }
                
            }
            
        }
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataManager.instance.saveContext()
    }
    
}


