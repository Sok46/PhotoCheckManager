//
//  ViewController.swift
//  PhotoCheckManager
//
//  Created by Сергей on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let contactButton: UIButton = {
       let button = UIButton()
        button.setTitle("Go to List", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        setupViews()
        setContraints()
        
        contactButton.addTarget(
            self,
            action: #selector(contactButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func contactButtonTapped() {
        let contactViewController = ManagerViewController()
        navigationController?.pushViewController(contactViewController, animated: true)
    }
    
    private func setupViews() {
        title = "CustomNavBar"
        view.addSubview(contactButton)
    }
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            contactButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contactButton.heightAnchor.constraint(equalToConstant: 50),
            contactButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

