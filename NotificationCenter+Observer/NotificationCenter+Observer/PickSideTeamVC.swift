//
//  PickSideTeamVC.swift
//  NotificationCenter+Observer
//
//  Created by Israel Manzo on 5/3/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

let captainColor = UIColor(red: 0/255, green: 26/255, blue: 77/255, alpha: 1)
let ironManColor = UIColor(red: 128/255, green: 0/255, blue: 0/255, alpha: 1)

class PickSideTeamVC: UIViewController {
    
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "ca"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCaptainSide)))
        return iv
    }()
    
    lazy var imageView2: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "iron"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleIronManSide)))
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTeamsView()
    }
}

// MARK: - extension contain actions to select team
extension PickSideTeamVC {
    @objc func handleCaptainSide(){
        let name = Notification.Name(rawValue: captainTeamKey)
        // This line sends a notification that the button was tapped
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleIronManSide(){
        let name = Notification.Name(rawValue: ironManTeamKey)
        // Notifies that the button was tap
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - extensino sets selection view
extension PickSideTeamVC {
    func setTeamsView(){
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(imageView2)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imageView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        imageView2.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView2.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}



