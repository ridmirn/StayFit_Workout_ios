//
//  DetailWorkoutViewController.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-26.
//

import UIKit
import SDWebImage

class DetailWorkoutVC: UIViewController {

    var workout: Workout?

    private let workoutImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        private let workoutTitleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .black
            return label
        }()
        
        private let workoutSubTitleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .gray
            return label
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            view.addSubview(workoutImageView)
            view.addSubview(workoutTitleLabel)
            view.addSubview(workoutSubTitleLabel)
            workoutImageView.sd_setImage(with: URL(string: workout!.image))
            workoutTitleLabel.text = workout?.workout_name
            workoutSubTitleLabel.text = workout?.duration
            
            // Set up constraints
            NSLayoutConstraint.activate([
                workoutImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                workoutImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                workoutImageView.widthAnchor.constraint(equalToConstant: 200),
                workoutImageView.heightAnchor.constraint(equalToConstant: 200),
                
                workoutTitleLabel.topAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: 20),
                workoutTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                workoutTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                workoutSubTitleLabel.topAnchor.constraint(equalTo: workoutTitleLabel.bottomAnchor, constant: 10),
                workoutSubTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                workoutSubTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
    }

