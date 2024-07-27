//
//  ViewController.swift
//  Arquitectura_mvc
//
//  Created by Cristian guillermo Romero garcia on 22/07/24.
//

import UIKit


class CharacterListViewController: UIViewController {
    var mainView: characersListView { self.view as! characersListView}
    let apiClient = ApiClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharacterTableViewDelegate?

    override func loadView() {
        view = characersListView()
        tableViewDelegate = ListOfCharacterTableViewDelegate()
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("INDEX: \(index)")
            
            //Present newViewController
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            let characterModel = dataSource.characters[index]
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(characterDetailViewController, animated: true)
            
        }
        
        Task {
            let characters = await apiClient.getListOfCharacters()
            print("Characters \(characters)")
            tableViewDataSource?.set(characters: characters.results)
        }
    }
    
  

}

