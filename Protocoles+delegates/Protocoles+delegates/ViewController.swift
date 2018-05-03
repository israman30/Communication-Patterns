//
//  ViewController.swift
//  Protocoles+delegates
//
//  Created by Israel Manzo on 5/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .yellow
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
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func handleSelectSide(){
        let captainController = CaptainTeam()
        captainController.selectedSideDelegate = self
        navigationController?.pushViewController(captainController, animated: true)
        print("Select Side")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(selectionBtn)
        view.addSubview(imageView)
        view.addSubview(sideLabel)
        
        selectionBtn.frame = CGRect(x: 85, y: 600, width: 200, height: 40)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
        sideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        sideLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        sideLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}

extension ViewController: SelectYourSideDelegate {
    func didSelectSide(img: UIImage, name: String) {
        imageView.image = img
    }
}

