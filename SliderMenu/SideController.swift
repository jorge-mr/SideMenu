//
//  ViewController.swift
//  SliderMenu
//
//  Created by Jorge MR on 09/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import UIKit

class SideController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let sections = ["Profile","Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenuNotify"), object: nil)
        switch indexPath.row {
        case 0:
            //Los Post son los que mandan la notificacion
            NotificationCenter.default.post(name: NSNotification.Name("ShowProfile"), object: nil)
        case 1:
            //Los Post son los que mandan la notificacion
            NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
        default:
            break
        }
    }
    


}

