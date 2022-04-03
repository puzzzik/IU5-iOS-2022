//
//  NetworkSerivce.swift
//  LABS
//
//  Created by Иван Тазенков on 02.04.2022.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
	func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
	private let session: URLSession

	init(session: URLSession) {
		self.session = session
	}

	func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
		DispatchQueue.global(qos: .userInitiated).async { [weak self] in
			self?.session.dataTask(with: request) { data, response, error in
				if let error = error {
					completion(.failure(error))
					return
				}
				guard
					let response = response as? HTTPURLResponse,
					response.statusCode == 200
				else {
					return
				}
				if let data = data {
					completion(.success(data))
				}
			}.resume()
		}
	}
}
