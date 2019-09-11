//
//  AppDelegate.swift
//  SDWebImage-WebP-bug
//
//  Created by Kenneth Krzeminski on 9/10/19.
//  Copyright © 2019 krze. All rights reserved.
//

import SDWebImage
import SDWebImageWebPCoder
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SDImageCodersManager.shared.addCoder(SDImageWebPCoder.shared)
        SDWebImageDownloader.shared.setValue("image/webp,image/*", forHTTPHeaderField: "Accept")
        
        guard let url = URL(string: "https://66.media.tumblr.com/c0700230bd00b3a4f6c5fd9f52ba38d4/634b65befca84981-56/s400x600/869fe1f4b3f08c98d3504aff1f985afa5aa9a3fa.gifv") else {
            return false
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ImageTableViewController(withImageCount: 5, url: url, style: .plain)
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
