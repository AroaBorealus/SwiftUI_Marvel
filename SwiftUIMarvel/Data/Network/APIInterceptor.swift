//
//  APIInterceptor.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import Foundation
import CommonCrypto

protocol APIInterceptor { }

protocol APIRequestInterceptorContract: APIInterceptor {
    func intercept(request: inout URLRequest)
}

final class APIRequestAuthenticatorInterceptor: APIRequestInterceptorContract {
    
    func intercept(request: inout URLRequest) {

        let ts = String(Date().timeIntervalSince1970)
        let privateKey = "6804ca74bcfcbf7446db38312149630b2c311767"
        let publicKey = "c759f8d1937a41560841ee92f4b16dc8"
        
        let hash = (ts+privateKey+publicKey).md5()
        
        let qi1 = URLQueryItem(name: "apikey", value: publicKey)
        let qi2 = URLQueryItem(name: "ts", value: ts)
        let qi3 = URLQueryItem(name: "hash", value: hash)
        let qi4 = URLQueryItem(name: "orderBy", value: "-modified")
        
        request.url?.append(queryItems: [qi1, qi2, qi3, qi4])
    }
}

extension String {
    func md5() -> String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))

        data.withUnsafeBytes { buffer in
            _ = CC_MD5(buffer.baseAddress, CC_LONG(data.count), &digest)
        }

        return digest.map { String(format: "%02x", $0) }.joined()
    }
}
