//
//  ColorViewController.swift
//  Protocols And Notifs
//
//  Created by Sai Kishore on 13/04/21.
//

import UIKit

class ColorViewController: UIViewController {

    let personTap = Notification.Name(rawValue: personTappedNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateName), name: personTap, object: nil)
    }
    
    @objc func updateName(notification: NSNotification){
        let color = notification.userInfo?["color"]
        view.backgroundColor = color as? UIColor
    }
}
