//
//  ViewController.swift
//  Arquitecture_MVVM
//
//  Created by Cristian guillermo Romero garcia on 24/07/24.
//

import UIKit
import Combine

class LoginView: UIViewController {
    
    private let loginViewModel = LoginViewModel(apiClient: APIClient())
    var cancellables = Set<AnyCancellable>()
    private let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Add Email"
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Add Password"
        textfield.borderStyle = .roundedRect
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    private lazy var loginButton: UIButton = {
        var  configuration = UIButton.Configuration.filled()
        configuration.title = "Login"
        configuration.subtitle = "Suscribete"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 8
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] action in
            self?.startLogin()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textColor = .red
        label.font = .systemFont(ofSize: 20, weight: .regular, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBindingViewWithViewModel()
        
        [emailTextField, passwordTextField, loginButton, errorLabel].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20)
        ])
    }
    
    private func startLogin(){
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {return}
        loginViewModel.userLogin(withEmail: email.lowercased(), password: password.lowercased())
    }
    
    func createBindingViewWithViewModel(){
        emailTextField.textPublisher
            .assign(to: \LoginViewModel.email, on: loginViewModel)
            .store(in: &cancellables)
        passwordTextField.textPublisher
            .assign(to: \LoginViewModel.password, on: loginViewModel)
            .store(in: &cancellables)
        
        loginViewModel.$isEnabled
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &cancellables)
        loginViewModel.$showLoading
            .assign(to: \.configuration!.showsActivityIndicator, on: loginButton)
            .store(in: &cancellables)
        loginViewModel.$errorMesage
            .assign(to: \UILabel.text!, on: errorLabel)
            .store(in: &cancellables)
        loginViewModel.$userModel.sink { [weak self] _ in
            print("Success, navigate to home view controller")
            let homeView = HomeView()
            self?.present(homeView, animated: true)
        }.store(in: &cancellables)
    }


}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never>{
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { notification in
                return (notification.object as? UITextField)?.text ?? ""
            }
            .eraseToAnyPublisher()
    }
}
