//
//  ListOfCharacterTableViewDelegate.swift
//  Arquitectura_mvc
//
//  Created by Cristian guillermo Romero garcia on 23/07/24.
//

import UIKit

class ListOfCharacterTableViewDelegate: NSObject, UITableViewDelegate{
    
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didTapOnCell?(indexPath.row)
    }
}

