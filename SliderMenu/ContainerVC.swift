//
//  ContainerVC.swift
//  SliderMenu
//
//  Created by Jorge MR on 09/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Los observadores son los que estan al pendiente si se lanza una notificacion
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name(rawValue: "ToggleSideMenuNotify"), object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func toggleSideMenu(){
        if sideMenuOpen {
            sideMenuOpen = false
            leadingConstraint.constant = -250
        }else{
            sideMenuOpen = true
            leadingConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}
