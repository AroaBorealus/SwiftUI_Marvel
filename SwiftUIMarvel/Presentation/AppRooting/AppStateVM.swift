//
//  AppState.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation
import Combine

@Observable
final class AppStateVM{
    //publicadas
    var status = Status.loading
    var tokenJWT : String = ""
    
    
//    //dependencias
//    @ObservationIgnored
//    private var loginUseCase: LoginUserCaseProtocol
//    
//    //inicializador
//    init(loginUC : LoginUserCaseProtocol = LoginUserCase()){
//        self.loginUseCase = loginUC
//        
//        //temporal.. borro
//        KeyChainKC().deleteKC(key: ConstantsApp.CONS_TOKEN_ID_KEYCHAIN)
//        
//        //Autologin
//        Task{
//            await validateControlLogin()
//        }
//        
//    }
//    
//    
//    ///Funcionalidad
//    
//    @MainActor
//    func loginApp(user: String, pass: String){
//        
//        self.status = .loading //indico que estoy cargando...
//        
//        Task {
//            if (await loginUseCase.loginApp(user: user, password: pass) == true){
//                //login Success
//                self.status = .loaded
//            } else {
//                //Login Error
//                self.status = .error(error: "Error con el usuario / clave")
//            }
//        }
//    }
//    
//    
//    //Close session app
//    @MainActor
//    func closeSessionUser(){
//        Task {
//            await loginUseCase.logout()
//            self.status = .none //que se muestre el login
//        }
//    }
//    
//    
//    //validate token
//    @MainActor
//    func validateControlLogin(){
//        Task{
//            if (await loginUseCase.validateToken() == true){
//                self.status = .loaded //Pa la home
//                NSLog("Login OK")
//            } else {
//                //no hay token en el key chain
//                self.status = .none
//                NSLog("Login ERROR")
//            }
//        }
//    }
    
    
}

