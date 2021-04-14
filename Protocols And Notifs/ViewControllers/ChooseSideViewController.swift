//
//  ChooseSideViewController.swift
//  Protocols And Notifs
//
//  Created by Sai Kishore on 13/04/21.
//

import UIKit




class ChooseSideViewController: UIViewController {

    @IBOutlet weak var sideOneButton: UIButton!
    
    @IBOutlet weak var sideTwoButton: UIButton!
    
    
    var didTapSide: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sideOneButtonPressed(_ sender: Any) {
        
        let name = Notification.Name(rawValue: sideOneNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
    
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func sideTwoButtonPressed(_ sender: Any) {
//        selectionDelegate.didTapChoice(name: "Side Two")
//        didTapSide?("Side Two")

        let name = Notification.Name(rawValue: sideTwoNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
}

