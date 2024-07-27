//
//  CharacterListView.swift
//  Arquitectura_mvc
//
//  Created by Cristian guillermo Romero garcia on 23/07/24.
//

import UIKit

class characersListView: UIView {
    let charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharactersListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        addSubview(charactersTableView)
        
        NSLayoutConstraint.activate([
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
