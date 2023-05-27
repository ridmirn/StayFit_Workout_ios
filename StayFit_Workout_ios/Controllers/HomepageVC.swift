//
//  WeightGainVC.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-20.
//

import UIKit

class HomepageVC: UIViewController {

        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Welcome Ridmi"
            label.textAlignment = .left
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 24)
            return label
            
        }()
        
        let  ScheduleButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            return button
        }()
        
        let  WorkoutButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            return button
        }()
        
        let  ProgressButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            return button
        }()
        
        private let bmiValue: Double
        
        let resultLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        init (bmiValue: Double){
            self.bmiValue = bmiValue
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //        view.addSubview(ScheduleButton)
            //        view.addSubview(WorkoutButton)
            //        view.addSubview(ProgressButton)
            view.backgroundColor = .white
            view.addSubview(titleLabel)
            setLabel()
            setupViews()
            setupContraints()
            displayBMIValue()
            setScheduleButton()
            setWorkoutButton()
            setProgressButton()
        }
        private func setupViews(){
            self.view.addSubview(resultLabel)
        }
        
        private func setupContraints(){
            NSLayoutConstraint.activate([
                self.resultLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.resultLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
                self.resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
                // self.resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
        
        private func displayBMIValue(){
            let formattedBMI = String(format: "%.2f", bmiValue)
            resultLabel.text = "Your BMI is \(formattedBMI)"
        }
        
        func setLabel(){
            self.view.addSubview(titleLabel)
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            ])
            
        }
        func setScheduleButton(){
            self.view.addSubview(ScheduleButton)
            self.ScheduleButton.backgroundColor = UIColor.AppColor
            self.ScheduleButton.setAttributedTitle(customButton, for: .normal)
            self.ScheduleButton.addTarget(self, action:#selector(gotoScheduleScreen), for: .touchUpInside)
            
            self.ScheduleButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.ScheduleButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
                self.ScheduleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
                self.ScheduleButton.heightAnchor.constraint(equalToConstant: 50),
                self.ScheduleButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            ])
        }
        
        func setWorkoutButton(){
            self.view.addSubview(WorkoutButton)
            self.WorkoutButton.backgroundColor = UIColor.AppColor
            self.WorkoutButton.setAttributedTitle(customWorkoutButton, for: .normal)
            self.WorkoutButton.addTarget(self, action:#selector(gotoWorkoutScreen), for: .touchUpInside)
            
            self.WorkoutButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.WorkoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
                self.WorkoutButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
                self.WorkoutButton.heightAnchor.constraint(equalToConstant: 50),
                self.WorkoutButton.topAnchor.constraint(equalTo: ScheduleButton.bottomAnchor, constant: 40),
            ])
        }
        func setProgressButton(){
            self.view.addSubview(ProgressButton)
            self.ProgressButton.backgroundColor = UIColor.AppColor
            self.ProgressButton.setAttributedTitle(customProgressButton, for: .normal)
            //self.WorkoutButton.addTarget(self, action:#selector(gotoProfileScreen), for: .touchUpInside)
            
            self.ProgressButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.ProgressButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
                self.ProgressButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
                self.ProgressButton.heightAnchor.constraint(equalToConstant: 50),
                self.ProgressButton.topAnchor.constraint(equalTo: WorkoutButton.bottomAnchor, constant: 40),
            ])
        }
        
        let customButton = NSMutableAttributedString(string: "Schedule", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ])
        
        let customWorkoutButton = NSMutableAttributedString(string: "See Workout", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ])
        
        let customProgressButton = NSMutableAttributedString(string: "Acivity", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        ])
        
        
        @objc func gotoScheduleScreen (){
            let schedueScreen = ScheduleScreenVC()
            navigationController?.pushViewController(schedueScreen, animated:true)
        }
    
    @objc func gotoWorkoutScreen (){
        let schedueScreen = WeightLossVC()
        navigationController?.pushViewController(schedueScreen, animated:true)
    }
    }

