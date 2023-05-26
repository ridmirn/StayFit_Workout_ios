//
//  WorkoutTableViewCell.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-26.
//
import UIKit

class WorkoutTableViewCell: UITableViewCell {
    var workoutimageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .gray.withAlphaComponent(0.65)
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    var workoutTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    
    var workoutSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(workoutimageView)
        addSubview(workoutTitleLabel)
        addSubview(workoutSubTitleLabel)
        
        NSLayoutConstraint.activate([
            workoutimageView.heightAnchor.constraint(equalToConstant: 75),
            workoutimageView.widthAnchor.constraint(equalToConstant: 75),
            workoutimageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            workoutimageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            
            workoutTitleLabel.topAnchor.constraint(equalTo: workoutimageView.topAnchor),
            workoutTitleLabel.leadingAnchor.constraint(equalTo: workoutimageView.trailingAnchor, constant: 8),
            workoutTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            workoutSubTitleLabel.topAnchor.constraint(equalTo: workoutTitleLabel.bottomAnchor),
            workoutSubTitleLabel.leadingAnchor.constraint(equalTo: workoutimageView.trailingAnchor, constant: 8),
            workoutSubTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}
