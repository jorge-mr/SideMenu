//
//  MainVC.swift
//  SliderMenu
//
//  Created by Jorge MR on 09/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Los observadores son los que estan al pendiente si se lanza una notificacion
        NotificationCenter.default.addObserver(self, selector: #selector(showScreen), name: NSNotification.Name(rawValue: "ShowProfile"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name(rawValue: "ShowSettings"), object: nil)
        /*
        Gesto de izquierda a derecha iniciando en cualquier parte de la pantalla
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(SideMenuVC.swipedLeft))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        */
        
        //Gesto de izquierda a derecha iniciando desde el borde de la pantalla
        let swipeLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.edges = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipedLeft() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenuNotify"), object: nil)
    }
    
    @objc func showScreen(){
        performSegue(withIdentifier: "showProfile", sender: nil)
    }
    
    @objc func showSettings(){
        performSegue(withIdentifier: "showSettings", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moreTab(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenuNotify"), object: nil)
    }

}
