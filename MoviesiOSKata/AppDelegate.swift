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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        appDependencies.installRootViewControllerIntoWindow(window!)
        
        return true
    }



}

