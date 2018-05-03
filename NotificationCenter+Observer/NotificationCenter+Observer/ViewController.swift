//
//  ViewController.swift
//  NotificationCenter+Observer
//
//  Created by Israel Manzo on 5/3/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Observer key values
let captainTeamKey = "cap.team.key"
let ironManTeamKey = "iron.team.key"

class ViewController: UIViewController {
    
    let civilWarColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
    
    // Sub.MARK: - Notification names
    let steve = Notification.Name(captainTeamKey)
    let tony = Notification.Name(ironManTeamKey)
    
    // MARK: - We remove the observer after these are been used - deinit will deallocate them from memory.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "civil")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let selectionBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Select Side", for: .normal)
        btn.addTarget(self, action: #selector(handleSelectSide), for: .touchUpInside)
        return btn
    }()
    
    let sideLabel: UILabel = {
        let label = UILabel()
        label.text = "Pick a Side"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Action to segue to next VC
    @objc func handleSelectSide(){
        let pickSideTeam = PickSideTeamVC()
        present(pickSideTeam, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        createObservers()
    }
}

// MARK: - extension to storage the obseververs
extension ViewController {
    // MARK: - Add Observer
    /* This function will observe the broadcast information sent it by the selection VC, using key values for each observer.
     */
    func createObservers(){
        // Steve Rogers Observers
        NotificationCenter.default.addObserver(self, selector: #selector(updateImage(notf:)), name: steve, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateName(notf:)), name: steve, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateView(notf:)), name: steve, object: nil)
        
        // Tony Stark Observers
        NotificationCenter.default.addObserver(self, selector: #selector(updateImage(notf:)), name: tony, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateName(notf:)), name: tony, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateView(notf:)), name: tony, object: nil)
    }
    
    // MARK: - Action block checks rather is there information for either team and trigger the data as soon observer find the right key.
    @objc func updateImage(notf: NSNotification){
        let isCapTeam = notf.name == steve
        let img = isCapTeam ? UIImage(named: "team-cap")! : UIImage(named: "team-iron")!
        imageView.image = img
    }
    
    @objc func updateName(notf: NSNotification){
        let isCapTeam = notf.name == steve
        let name = isCapTeam ? "Captain Team" : "Iron Man Team"
        sideLabel.text = name
    }
    
    @objc func updateView(notf: NSNotification){
        let isCapTeam = notf.name == steve
        let viewColor = isCapTeam ? captainColor : ironManColor
        view.backgroundColor = viewColor
    }
}

// MARK: - extension sets main view
extension ViewController {
    
    func setView(){
        
        view.backgroundColor = civilWarColor
        
        [selectionBtn, imageView, sideLabel].forEach({view.addSubview($0)})
        
        selectionBtn.frame = CGRect(x: 12, y: 600, width: 350, height: 40)
        selectionBtn.layer.cornerRadius = 5
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 245).isActive = true
        
        sideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 440).isActive = true
        sideLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        sideLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}



