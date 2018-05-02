//
//  ViewController.swift
//  Protocoles+delegates
//
//  Created by Israel Manzo on 5/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

protocol SideSelctionDelegate {
    func didChooseSide(img: UIImage, name: String, color: UIColor)
}

class ViewController: UIViewController {
    
    var selectionDelegate: SideSelctionDelegate?
    
    let capTeam: UIButton = {
        let iv = UIButton()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setImage(UIImage(named: "ca"), for: .normal)
        iv.addTarget(self, action: #selector(handleCapTeam), for: .touchUpInside)
        return iv
    }()
    
    let ironTeam: UIButton = {
        let iv = UIButton()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setImage(UIImage(named: "iron"), for: .normal)
        iv.addTarget(self, action: #selector(handleIronTeam), for: .touchUpInside)
        return iv
    }()

    @objc func handleIronTeam(){
        let ironManTeam = IronManTeam()
        selectionDelegate?.didChooseSide(img: UIImage(named: "ca")!, name: "Captain America", color: .blue)
        navigationController?.pushViewController(ironManTeam, animated: true)
        print("Iron Team")
    }
    
    @objc func handleCapTeam(){
        let captainTeam = CaptainTeam()
        selectionDelegate?.didChooseSide(img: UIImage(named: "iron")!, name: "Iron Man", color: .red)
        navigationController?.pushViewController(captainTeam, animated: true)
        print("Cap Team")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.title = "Pick your team"
        setView()
    }
    
    func setView(){
        view.addSubview(capTeam)
        view.addSubview(ironTeam)
        
        capTeam.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        capTeam.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        capTeam.widthAnchor.constraint(equalToConstant: 250).isActive = true
        capTeam.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        ironTeam.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ironTeam.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        ironTeam.widthAnchor.constraint(equalToConstant: 250).isActive = true
        ironTeam.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

