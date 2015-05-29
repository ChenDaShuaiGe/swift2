//
//  AppDelegate.swift
//  swift2
//
//  Created by ssf-2 on 15-4-27.
//  Copyright (c) 2015年 CH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
//        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        
        // Override point for customization after application launch.
        return true
    }
    
    func initTabBar(){
        let tabBar = UITabBarController()
        
        let vc1 = FirstViewController()
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 1)
        
        let vc2 = SecViewController()
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Downloads, tag: 2)
        
        let vc3 = ThirdViewController()
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 3)
        
        let vc4 = FourthViewController()
        vc4.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.History, tag: 4)
        
        let arr = NSArray(objects: vc1,vc2,vc3,vc4)
        tabBar.setViewControllers(arr, animated: false)
        window?.rootViewController = tabBar
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

