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
    var status = Status.loading
    var tokenJWT : String = ""
}

