//
//  AppDelegate.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 1/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    let appDependencies = AppDependencies()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        appDependencies.installRootViewControllerIntoWindow(window!)
        
        return true
    }



}

