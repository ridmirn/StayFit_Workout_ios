//
//  WorkoutResponse.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-20.
//

import UIKit

struct WorkoutResponse: Codable {
    let workouts: [Workout]
    
    private enum CodingKeys: String, CodingKey{
        case workouts = "documents"
    }
}

struct StringValue: Codable {
    let value: String
    
    private enum CodingKeys: String, CodingKey{
        case value = "stringValue"
    }
}

struct Workout: Codable {
    let workout_name: String
    let duration: String
    let image: String

    
    private enum WorkoutKeys: String, CodingKey {
        case fields
    }
    
    private enum FieldKeys: String, CodingKey {
        case workout_name
        case duration
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WorkoutKeys.self)
        let fieldContainer = try container.nestedContainer(keyedBy: FieldKeys.self, forKey: .fields)
        
        workout_name = try fieldContainer.decode(StringValue.self, forKey: .workout_name).value
        duration = try fieldContainer.decode(StringValue.self, forKey: .duration).value
        image = try fieldContainer.decode(StringValue.self, forKey: .image).value
        
    }
}
