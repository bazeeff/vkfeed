//
//  NetworkService.swift
//  VkFeed
//
//  Created by Ivan0v42 on 03.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//
import Foundation
import Alamofire
protocol Networking {
    func request(path: String, params: [String: String])->DataRequest
}

final class NetworkService: Networking {
    
    private let authService: AuthService

    init(authService: AuthService = AppDelegate.shared().authService) {
        self.authService = authService
    }

    func request(path: String, params: [String : String])->DataRequest {
        let token = authService.token
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        let url = self.url(from: path, params: allParams)
        print(url)
        
        return AF.request(url)
        
        }
        
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map {  URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
