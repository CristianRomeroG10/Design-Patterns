//
//  CharacterDetailViewController.swift
//  Arquitectura_mvc
//
//  Created by Cristian guillermo Romero garcia on 24/07/24.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    var mainView: CharacterDetailView {self.view as! CharacterDetailView}
    
    init(characterDetailModel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.configure(characterDetailModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
