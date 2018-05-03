//
//  ViewController.swift
//  Protocoles+delegates
//
//  Created by Israel Manzo on 5/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let selectionBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Select Side", for: .normal)
        btn.addTarget(self, action: #selector(handleSelectSide), for: .touchUpInside)
        return btn
    }()
    
    
    @objc func handleSelectSide(){
        let captainController = CaptainTeam()
        navigationController?.pushViewController(captainController, animated: true)
        print("Select Side")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(selectionBtn)
        
        selectionBtn.frame = CGRect(x: 85, y: 600, width: 200, height: 40)
    }
    
}

