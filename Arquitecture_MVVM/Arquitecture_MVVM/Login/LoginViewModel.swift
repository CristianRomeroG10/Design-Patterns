//
//  LoginViewModel.swift
//  Arquitecture_MVVM
//
//  Created by Cristian guillermo Romero garcia on 24/07/24.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var isEnabled = false
    @Published var showLoading = false
    @Published var errorMesage = ""
    @Published var userModel: User?
    
    var cancellables = Set<AnyCancellable>()
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        
        formValidation()
    }
    
    func formValidation(){
        Publishers.CombineLatest($email, $password)
            .filter { email, password in
                return email.count > 5 && password.count > 5
            }
            .sink { value in
                self.isEnabled = true
            }.store(in: &cancellables)
    }
    
    @MainActor
    func userLogin(withEmail email: String, password: String){
        errorMesage = ""
        showLoading = true
        Task{
            do{
                userModel = try await apiClient.login(withEmail: email, password: password)
            }catch let error as BackendError{
                errorMesage = error.rawValue
            }
            showLoading = false
        }
    }
}
