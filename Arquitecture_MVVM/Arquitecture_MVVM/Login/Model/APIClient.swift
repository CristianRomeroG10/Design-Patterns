//
//  APIClient.swift
//  Arquitecture_MVVM
//
//  Created by Cristian guillermo Romero garcia on 24/07/24.
//

import Foundation

enum BackendError: String, Error {
    case invalidEmail = "Comprueba el email"
    case invalidPassword = "Compruebe contraseña"
}

struct APIClient {
    func login(withEmail email: String, password: String) async throws -> User{
        //Simular petición HTTP y esperar 2 segundos
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return try simulateBackendLogic(email: email, password: password)
    }
}

func simulateBackendLogic(email: String, password: String) throws -> User{
    guard email == "cristian.romerogarcia10@gmail.com" else {
        print("El User no fue reconocido")
        throw BackendError.invalidEmail
    }
    guard password == "1234567890" else {
        print("Contraseña incorrecta")
        throw BackendError.invalidPassword
    }
    print("Success")
    return .init(
        name: "CristianRomeroG10",
        token: "token_12345678",
        sessionStart: .now)
}
