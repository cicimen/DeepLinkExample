//
//  AppDelegate.swift
//  DeepLinkExample
//
//  Created by Egemen on 19.07.2020.
//  Copyright © 2020 Egemen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        print(url.scheme!)
        
        if let scheme = url.scheme, scheme.localizedCaseInsensitiveCompare("com.egemen.deeplinkexample") == .orderedSame, let view = url.host {
            
            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            if view.lowercased() == "first" || view.lowercased() == "second" {
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    if view.lowercased() == "first" {
                        let viewController = storyBoard.instantiateViewController(withIdentifier: "first") as! FirstViewController
                        viewController.parameters = parameters
                        topController.present(viewController, animated: false, completion: nil)
                    }else if view.lowercased() == "second" {
                        let viewController = storyBoard.instantiateViewController(withIdentifier: "second") as! SecondViewController
                        viewController.parameters = parameters
                        topController.present(viewController, animated: false, completion: nil)
                    }
                }
            }
            
            
            
            
            
            //redirect(to: view, with: parameters)
        }
        return true
    }
    
    
    
    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

