//
//  NetworkingManager.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-20.
//

import Foundation

struct Constants {
    static let API_KEY = "AIzaSyDVG4TjUX7GLHpOMMk1GwWv29qLRWvNWH4"
    static let baseURL = "https://firestore.googleapis.com/v1/projects"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getWeightLoss(completion: @escaping (Result<[Workout],Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/stayfit-workoutapp-ios/databases/(default)/documents/Weight_loss") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do{
                let results = try JSONDecoder().decode(WorkoutResponse.self, from: data)
                completion(.success(results.workouts))
            
            }catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    func getWeightGain(completion: @escaping (Result<[Workout],Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/stayfit-workoutapp-ios/databases/(default)/documents/Weight_gain") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do{
                let results = try JSONDecoder().decode(WorkoutResponse.self, from: data)
                completion(.success(results.workouts))
            
            }catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
}
