//
//  AppDelegate.swift
//  appname
//
//  Created by Matteo Crippa on 12/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Log

let log = Logger()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        #if DEBUG
        log.enabled = true
        log.minLevel = .Trace
        #else
        log.enabled = false
        #endif

        // white status bar
        // UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)

        // push notifications enabled
        /*
        let userNotificationTypes: UIUserNotificationType = [.Alert, .Badge, .Sound]
        let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        */

        // crashlytics enabled
        Fabric.with([Crashlytics.self])

        return true
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {
      // reset badge counter to 0
      // UIApplication.sharedApplication().applicationIconBadgeNumber = 0
    }

    func applicationWillTerminate(application: UIApplication) {}

//    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
//
//        // push token retrieved and cleaned
//        //let token = deviceToken.description.componentsSeparatedByCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet).joinWithSeparator("")
//
//        // now need to store somewhere
//        /*Alamofire.request(.GET, pushEndpoint, parameters: ["token": token])
//            .responseJSON { response in
//                log.debug(response)
//        }*/
//
//    }

}
