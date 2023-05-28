//
//  OpenAICallerService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-29.
//

import Foundation
import OpenAISwift


final class OpenAICallerService {
    
    static let shared = OpenAICallerService()
    private var client: OpenAISwift?
    
    private init() {}
    
    public func setup(){
        self.client = OpenAISwift(authToken: OpenAPIKeys().openAISecretKey)
    }
    
    public func getResponse(input: String, completion : @escaping (Result<String, Error>) -> Void){
        client?.sendCompletion(with: input, maxTokens: 1000, completionHandler: { result in
            switch result{
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
                completion(.success(output ))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
