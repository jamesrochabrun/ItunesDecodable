
//
//  GenericAPI.swift
//  ItunesAPISearch
//
//  Created by james rochabrun on 12/12/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.

import PromiseKit
import Foundation

protocol APIClient {
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest,
                             decode: @escaping (Decodable) -> T?) -> Promise<T>
}

extension APIClient {
    
    /// helper method
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    
    func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?) -> Promise<T> {
        return Promise { fulfill, reject in
        let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
            
            //MARK: change to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        reject(error)
                    } else {
                        reject(APIError.invalidData)
                    }
                    return
                }
                if let value = decode(json) {
                    fulfill(value)
                } else {
                    reject(APIError.jsonParsingFailure)
                }
            }
        }
        task.resume()
        }
    }
}




