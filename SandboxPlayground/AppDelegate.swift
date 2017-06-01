//
//  AppDelegate.swift
//  SandboxPlayground
//
//  Created by Fernando Rodríguez Romero on 13/05/16.
//  Copyright © 2016 udacity.com. All rights reserved.
//

import UIKit

// MARK: - AppDelegate: UIResponder, UIApplicationDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func sandboxPlayground() -> Void {
        let fileManager = FileManager.default
        print(fileManager)
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths)
        if let path = paths.last?.appendingPathComponent("file.txt") {
            
            print(path)
            
            // Writing file.txt
            do {
                let content = "Hi There!"
                try content.write(to: path, atomically: true, encoding: .utf8)
            } catch {
                print("Error writing content into 'file.text'")
            }
            
            // Reading file.txt
            do {
                let content = try String(contentsOf: path, encoding: .utf8)
                if content == "Hi There!" {
                    print("Yay")
                } else {
                    print("Oops")
                }
            } catch {
                print("Something went wrong")
            }
        }
    }

    // MARK: Properties
    
    var window: UIWindow?

    // MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sandboxPlayground()
        return true
    }
}
