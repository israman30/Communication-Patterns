//
//  CaptainTeam.swift
//  Protocoles+delegates
//
//  Created by Israel Manzo on 5/2/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class CaptainTeam: UIViewController {
    
    var selection: UIImage!
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .blue
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleView)))
        return iv
    }()
    
    @objc func handleView(){
        print("work")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        print("=========== \(selection)")
        imageView.image = selection
        
    }
}


