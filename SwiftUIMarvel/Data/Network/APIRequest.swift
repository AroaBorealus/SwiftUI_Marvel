//
//  APIRequest.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation
import SwiftData

enum HTTPMethod: String {
    case GET, POST, PUT, UPDATE, HEAD, PATCH, DELETE, OPTIONS
}

protocol APIRequest {
    var host: String { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    var path: String { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
    
    associatedtype Response: Decodable
    typealias APIRequestResponse = Result<Response, APIErrorResponse>
    typealias APIRequestCompletion = (APIRequestResponse) -> Void
}

extension APIRequest {
    var host: String { "gateway.marvel.com" }
    var queryParameters: [String: String] { [:] }
    var headers: [String: String] { [:] }
    var body: Encodable? { nil }
    
    func getRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        if !queryParameters.isEmpty {
            components.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let finalURL = components.url else {
            throw APIErrorResponse.malformedURL(path)
        }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        if method != .GET, let body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        request.allHTTPHeaderFields = ["Accept": "application/json", "Content-Type": "application/json"].merging(headers) { $1 }
        request.timeoutInterval = 10
        return request
    }
}

// MARK: - Execution
extension APIRequest {
    func perform(session: APISessionContract = APISession.shared) async throws -> Response {
        do {
            let data = try await session.request(apiRequest: self)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .custom { decoder -> Date in
                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                formatter.locale = Locale(identifier: "en_US_POSIX")
                
                if let date = formatter.date(from: dateString) {
                    return date
                } else if dateString == "-0001-11-30T00:00:00-0500" {
                    return Date.distantPast
                } else {
                    NSLog("Formato de fecha desconocido: \(dateString), asignando Date.distantPast.")
                    return Date.distantPast
                }
            }
            
            let decodedResponse = try decoder.decode(Response.self, from: data)
            
            if Response.self == Void.self {
                return () as! Response // Forzar el tipo Void como respuesta
            } else if Response.self == Data.self {
                return data as! Response // Devolver los datos sin decodificar
            }
            
            return decodedResponse
        } catch let error as APIErrorResponse {
            throw error // Propagar errores específicos de la API
        } catch {
            throw APIErrorResponse.unknown(path) // Propagar un error genérico
        }
    }
}
