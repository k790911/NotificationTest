//
//  ViewController.swift
//  NotificationTest
//
//  Created by 김재훈 on 2022/05/19.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var badgeNo: Int = 0
    
    let content = UNMutableNotificationContent()

    let btn: UIButton = {
        let l = UIButton()
        l.setTitle("Set Notification", for: .normal)
        l.frame.size = CGSize(width: 250, height: 52)
        l.backgroundColor = .black
        return l
    }()
    
    let btn2: UIButton = {
        let l = UIButton()
        l.setTitle("Release Badge", for: .normal)
        l.frame.size = CGSize(width: 250, height: 52)
        l.backgroundColor = .black
        return l
    }()
    
    let btn3: UIButton = {
        let l = UIButton()
        l.setTitle("Set Notification", for: .normal)
        l.frame.size = CGSize(width: 250, height: 52)
        l.backgroundColor = .black
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(btn)
        btn.center.x = view.center.x
        btn.center.y = view.center.y
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(btn2)
        btn2.setTitle("Release Badge", for: .normal)
        btn2.center.x = view.center.x
        btn2.center.y = view.center.y + 200
        btn2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        view.addSubview(btn3)
        btn3.setTitle("Badge No. UP", for: .normal)
        btn3.center.x = view.center.x
        btn3.center.y = view.center.y + 400
        btn3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { didAllow, error in
        }
        
        badgeNo = UIApplication.shared.applicationIconBadgeNumber
        print(badgeNo)
    }
    
    @objc func buttonTapped() {
        print("button tapped.")
        
        content.title = "THis is JaeHOon"
        content.subtitle = "mola mola"
        content.body = "this is body"
        content.badge = NSNumber(value: badgeNo) // 여기서 입려된 배지는 센터에서 호출 될 시 나타남.
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timedone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }

    @objc func button2Tapped() {
        print("button2 tapped.")
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    @objc func button3Tapped() {
        badgeNo += 1
        print(badgeNo)
    }
}

