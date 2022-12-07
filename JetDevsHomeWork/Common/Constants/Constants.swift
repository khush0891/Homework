//
//  Constants.swift
//  JetDevsHomeWork
//
//  Created by Gary.yao on 2021/10/29.
//

import UIKit

let screenFrame: CGRect = UIScreen.main.bounds
let screenWidth = screenFrame.size.width
let screenHeight = screenFrame.size.height


let isIPhoneX = (screenWidth >= 375.0 && screenHeight >= 812.0) ? true : false
let isIPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false

let statusBarHeight: CGFloat = isIPhoneX ? 44.0 : 20.0
let navigationBarHeight: CGFloat = 44.0
let statusBarNavigationBarHeight: CGFloat = isIPhoneX ? 88.0 : 64.0

let tabbarSafeBottomMargin: CGFloat = isIPhoneX ? 34.0 : 0.0
let tabBarHeight: CGFloat = isIPhoneX ? (tabBarTrueHeight+34.0) : tabBarTrueHeight
let tabBarTrueHeight: CGFloat = 49.0


let networkManager = NetworkManager.sharedInstance




let login = "https://jetdevs.mocklab.io/login"
    




 func setAlerts(vc:UIViewController,strTitle:String,strMessage:String){
    let alert = UIAlertController.init(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
    let action:UIAlertAction = UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
        
    })
    alert.addAction(action)
    vc.present(alert, animated: true, completion: nil)
}



func differenceOfDates(startDate: String) -> Int {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let formatedStartDate = dateFormatter.date(from: startDate)
    let currentDate = Date()
    let previousDate = startDate

    let previousDateFormated : Date? = dateFormatter.date(from: previousDate)
    let difference = currentDate.timeIntervalSince(previousDateFormated!)
    var differenceInDays = Int(difference/(60 * 60 * 24 ))
    print(differenceInDays)
    

    return differenceInDays
    
}
