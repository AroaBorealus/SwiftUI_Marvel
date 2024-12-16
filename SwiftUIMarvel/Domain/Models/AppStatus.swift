//
//  AppStatus.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation

///Estados de la aplicacion
enum Status {
    case loading, ready, error(error: String)
}
