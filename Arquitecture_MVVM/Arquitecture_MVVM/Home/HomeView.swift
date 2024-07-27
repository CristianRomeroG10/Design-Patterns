//
//  HomeView.swift
//  Arquitecture_MVVM
//
//  Created by Cristian guillermo Romero garcia on 26/07/24.
//

import UIKit

class HomeView: UIViewController{
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold, width: .standard)
        label.text = "¿Quieres seguir aprendiendo a crear apps en swift 🤩?, suscribete a mi canal para seguir aprendiendo 🚀"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(messageLabel)
        setUpConstrains()
    }
    
    private func setUpConstrains(){
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -60),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
}
