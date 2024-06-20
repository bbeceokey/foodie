//
//  Network Manager.swift
//  foodie
//
//  Created by Busra Ece on 16.06.2024.
//

import Alamofire
import Foundation

typealias NetworkError = AFError

enum RequestStatus {
    case loading, success, failure
}

class NetworkManager {
    static let instance: NetworkManager = .init()

    private let baseUrl = "http://localhost:8222" // value from env var or config
    private let userDefaults = UserDefaults.standard

    func get<Output: Decodable>(_ url: String,
                                output _: Output.Type,
                                completion: @escaping (Result<Output, NetworkError>) -> Void)
    {
        AF.request(baseUrl + url, interceptor: self).validate().responseDecodable(of: Output.self) { response in

            completion(response.result)
        }
    }

    func delete<Output: Decodable>(_ url: String,
                                   output _: Output.Type,
                                   completion: @escaping (Result<Output, NetworkError>) -> Void)
    {
        AF.request(baseUrl + url, method: .delete,
                   interceptor: self).validate().responseDecodable(of: Output.self) { response in

            completion(response.result)
        }
    }

    func post<Input: Codable, Output: Decodable>(_ url: String,
                                                       input: Input,
                                                       output _: Output.Type,
                                                       completion: @escaping (Result<Output, NetworkError>) -> Void)
        {
            AF.request(baseUrl + url,
                       method: .post,
                       parameters: input,
                       encoder: JSONParameterEncoder.default,
                       headers: HTTPHeaders(["Content-Type": "application/json"]))
                .validate()
                .responseDecodable(of: Output.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }

    func put<Input: Encodable, Output: Decodable>(_ url: String,
                                                  input: Input,
                                                  output _: Output.Type,
                                                  completion: @escaping (Result<Output, NetworkError>) -> Void)
    {
        AF.request(baseUrl + url,
                   method: .put,
                   parameters: input,
                   encoder: .json,
                   headers: [
                    .init(name: "Content-Type", value: "application/json"),
                   ],
                   interceptor: self)
        .validate()
        .responseDecodable(of: Output.self) { response in
            completion(response.result)
        }
    }

    func patch<Input: Encodable, Output: Decodable>(_ url: String,
                                                    input: Input,
                                                    output _: Output.Type,
                                                    completion: @escaping (Result<Output, NetworkError>) -> Void)
    {
        AF.request(baseUrl + url,
                   method: .patch,
                   parameters: input,
                   encoder: .json,
                   headers: [
                    .init(name: "Content-Type", value: "application/json"),
                   ],
                   interceptor: self)
        .validate()
        .responseDecodable(of: Output.self) { response in
            completion(response.result)
        }
    }
}

extension NetworkManager: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for _: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest

        if let token = userDefaults.string(forKey: "SECURE_JWT") {
            let bearerToken = "Bearer \(token)"
            request.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        }

        completion(.success(request))
    }
}


