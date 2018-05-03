//
//  ViewController.swift
//  Protocoles+delegates
//
//  Created by Israel Manzo on 5/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let civilWarColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "civil")
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
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func handleSelectSide(){
        let captainController = CaptainTeam()
        // MARK: - setting delegation from selection view to main view
        captainController.selectedSideDelegate = self
        present(captainController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
}

// MARK: - extension set protocole on main view
extension ViewController: SelectYourSideDelegate {
    func didSelectSide(img: UIImage, name: String, color: UIColor) {
        imageView.image = img
        sideLabel.text = name
        view.backgroundColor = color
    }
}

// MARK: - extension sets main view
extension ViewController {
    
    func setView(){
        
        view.backgroundColor = civilWarColor
        
        [selectionBtn, imageView, sideLabel].forEach({view.addSubview($0)})
        
        selectionBtn.frame = CGRect(x: 85, y: 600, width: 200, height: 40)
        
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

