//
//  CharactersListCellView.swift
//  Arquitectura_mvc
//
//  Created by Cristian guillermo Romero garcia on 23/07/24.
//

import UIKit
import Kingfisher

class CharactersListCellView: UITableViewCell{
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let characterName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let characterStatus: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let characterSpecie: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(characterImageView)
        addSubview(characterName)
        addSubview(characterStatus)
        addSubview(characterSpecie)
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalToConstant: 80),
            
            characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            characterName.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            
            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8),
            
            characterSpecie.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterSpecie.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 8)
            
        ])
    }
    
    func configure(_ model: CharacterModel){
        characterName.text = model.name
        characterStatus.text = model.status
        characterSpecie.text = model.species
        characterImageView.kf.setImage(with: URL(string: model.image))
    }
}
