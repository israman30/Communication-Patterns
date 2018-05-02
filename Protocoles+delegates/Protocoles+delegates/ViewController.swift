//
//  ViewController.swift
//  Protocoles+delegates
//
//  Created by Israel Manzo on 5/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let capTeam: UIButton = {
        let iv = UIButton()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setImage(UIImage(named: "ca"), for: .normal)
        iv.addTarget(self, action: #selector(handleCapTeam), for: .touchUpInside)
        return iv
    }()
    
    @objc func handleCapTeam(){
        print("Cap Team")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setView()
    }
    
    func setView(){
        view.addSubview(capTeam)
        
        capTeam.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        capTeam.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        capTeam.widthAnchor.constraint(equalToConstant: 250).isActive = true
        capTeam.heightAnchor.constraint(equalToConstant: 200).isActive = true    }
}

