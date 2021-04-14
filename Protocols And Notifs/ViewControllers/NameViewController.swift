//
//  NameViewController.swift
//  Protocols And Notifs
//
//  Created by Sai Kishore on 13/04/21.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!

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
        let name = notification.userInfo?["name"]
        nameLabel.textColor = .label
        nameLabel.text = name as? String
    }

}
