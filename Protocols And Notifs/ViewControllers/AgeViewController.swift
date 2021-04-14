//
//  AgeViewController.swift
//  Protocols And Notifs
//
//  Created by Sai Kishore on 13/04/21.
//

import UIKit

class AgeViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    
    let personTap = Notification.Name(rawValue: personTappedNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        // Do any additional setup after loading the view.
    }
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateName), name: personTap, object: nil)
    }
    
    @objc func updateName(notification: NSNotification){
        let age = notification.userInfo?["age"]
        ageLabel.textColor = .label
        ageLabel.text = String((age as? Int) ?? -1)
    }
    



}
