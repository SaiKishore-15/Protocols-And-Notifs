//
//  ViewController.swift
//  Protocols And Notifs
//
//  Created by Sai Kishore on 13/04/21.
//

import UIKit

let sideOneNotificationKey = "co.saikishore.sideOne"
let sideTwoNotificationKey = "co.saikishore.sideTwo"
let personTappedNotificationKey = "co.saikishore.personTapped"


class ViewController: UIViewController {

    @IBOutlet weak var chooseSide: UIButton!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    @IBOutlet weak var sideLabel: UILabel!
    
    let sideOne = Notification.Name(rawValue: sideOneNotificationKey)
    let sideTwo = Notification.Name(rawValue: sideTwoNotificationKey)
    let personTap = Notification.Name(rawValue: personTappedNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        setupDelegatesAndDataSources()
    }
    
    func setupDelegatesAndDataSources(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func createObservers() {
        // Light Observers
        NotificationCenter.default.addObserver(self, selector: #selector(updateSideOneName(notification:)), name: sideOne, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateSideOneName(notification:)), name: sideTwo, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(doNothing), name: personTap, object: nil)
        
    }

    @objc func updateSideOneName(notification: NSNotification){
        let isOne = notification.name == sideOne
        let name = isOne ? "Side One " : "Side Two"
        sideLabel.textColor = .label
        sideLabel.text = name
    }
    
    @objc func doNothing(){
        
    }
    
    @IBAction func chooseScreenPressed(_ sender: Any) {
        let chooseSideViewController = storyboard?.instantiateViewController(identifier: "chooseSideViewController") as! ChooseSideViewController
        
        present(chooseSideViewController, animated: true, completion: nil)
    }
    
}

// Nothing Much

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return People.instance.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "personCell")!
        cell.textLabel?.text = People.instance.people[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = People.instance.people[indexPath.row]
        // Notify Everybody here, pass his object to everybody s
        let name = Notification.Name(rawValue: personTappedNotificationKey)
        NotificationCenter.default.post(name: name, object:nil, userInfo: person.dictionary)
    
    }
}
