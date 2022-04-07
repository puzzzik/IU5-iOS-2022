//
//  NetworkSerivce.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation

// MARK: - NetworkServiceProtocol

protocol NetworkServiceProtocol: AnyObject {
    func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

// MARK: - NetworkService

final class NetworkService: NetworkServiceProtocol {
    // MARK: Lifecycle

    init(session: URLSession) {
        self.session = session
    }

    // MARK: Internal

    func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }
        }.resume()
    }

    // MARK: Private

    private let session: URLSession
}
