//
//  AppDelegate.swift
//  OnesmallprojectOfMemeME
//
//  Created by Amjad khalid  on 13/11/2018.
//  Copyright © 2018 Amjad khaled. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    //This is an array of Meme instances
    var memes = [Meme]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
}

