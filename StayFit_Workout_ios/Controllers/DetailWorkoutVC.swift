//
//  DetailWorkoutViewController.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-22.
//

import UIKit
import SDWebImage

class DetailWorkoutVC: UIViewController {
    
    private var countdownLabel: UILabel!
    private var startButton: UIButton!
    
    private var timer: Timer?
    private var remainingTime = 10
   // private var isPaused = false
    
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
    
       setupUI()
        
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
    
    private func setupUI(){
        self.countdownLabel = UILabel()
        self.countdownLabel.textAlignment = .center
        self.countdownLabel.font = UIFont.systemFont(ofSize: 60)
        // self.countdownLabel.backgroundColor = .white
        self.countdownLabel.textColor = .black
        self.countdownLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(countdownLabel)
        self.countdownLabel.topAnchor.constraint(equalTo: workoutSubTitleLabel.bottomAnchor, constant: 50)
        self.countdownLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.countdownLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true


        self.startButton = UIButton(type: .system)
        self.startButton.setTitle("Start", for: .normal)
        self.startButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.startButton.tintColor = .black
        self.startButton.layer.cornerRadius = 8
        self.startButton.layer.masksToBounds = true
        // self.startButton.configuration?.baseBackgroundColor = UIColor.AppColor
        self.startButton.backgroundColor = UIColor.AppColor
        self.startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        self.startButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        self.startButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30).isActive = true
        self.startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.startButton.topAnchor.constraint(equalTo: countdownLabel.bottomAnchor, constant: 40).isActive = true
        self.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }

    @objc private func startButtonTapped(){
        startCountDown()
    }
    
    private func startCountDown(){
        startButton.isEnabled = false
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
    }
    
    @objc private func updateCountDown(){
        //if var remainingTime = Int(workoutSubTitleLabel.text ?? ""){
            if remainingTime > 0 {
                countdownLabel.text = "\(remainingTime)"
                remainingTime -= 1
            }else{
                countdownLabel.text = "Done!"
                startButton.isEnabled = true
                timer?.invalidate()
            }
//        }else{
//
//            print("Invalid Value")
//        }
    }
}
