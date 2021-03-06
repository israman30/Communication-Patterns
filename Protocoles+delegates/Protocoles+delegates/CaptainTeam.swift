//
//  CaptainTeam.swift
//  Protocoles+delegates
//
//  Created by Israel Manzo on 5/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - setting protocol to select team
protocol SelectYourSideDelegate {
    func  didSelectSide(img: UIImage, name: String, color: UIColor)
}

class CaptainTeam: UIViewController {
    
    let captainColor = UIColor(red: 0/255, green: 26/255, blue: 77/255, alpha: 1)
    let ironManColor = UIColor(red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
    
    var selectedSideDelegate: SelectYourSideDelegate!
    
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
        setTeamsView()
    }
    
}

// MARK: - extension contain actions to select team
extension CaptainTeam {
    @objc func handleCaptainSide(){
        selectedSideDelegate.didSelectSide(img: UIImage(named: "team-cap")!, name: "Captain Side", color: captainColor)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleIronManSide(){
        selectedSideDelegate.didSelectSide(img: UIImage(named: "team-iron")!, name: "Iron Man Side", color: ironManColor)
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - extensino sets selection view
extension CaptainTeam {
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


