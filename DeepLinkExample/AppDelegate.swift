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
        if let scheme = url.scheme, scheme.localizedCaseInsensitiveCompare("com.myApp") == .orderedSame, let view = url.host {
            
            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            
            
            if view.lowercased() == "first" {
                let viewController = storyBoard.instantiateViewController(withIdentifier: "first") as! FirstViewController
                viewController.parameters = parameters
                UIApplication.shared.windows.first?.rootViewController?.present(viewController, animated: true, completion: nil)
            }else if view.lowercased() == "second" {
                let viewController = storyBoard.instantiateViewController(withIdentifier: "first") as! SecondViewController
                viewController.parameters = parameters
                UIApplication.shared.windows.first?.rootViewController?.present(viewController, animated: true, completion: nil)
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

