//
//  Timer.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-27.
//

import UIKit

class DetailspageVC: UIViewController {

    private var countdownLabel: UILabel!
    private var startButton: UIButton!
private var resetButton: UIButton!
    private var pauseButton: UIButton!
    private var timer: Timer?
 private var isPaused = false
  
    private var remainingTime = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()

    }
    
    private func setupUI(){
        self.countdownLabel = UILabel()
        self.countdownLabel.textAlignment = .center
        self.countdownLabel.font = UIFont.systemFont(ofSize: 60)
       // self.countdownLabel.backgroundColor = .white
        self.countdownLabel.textColor = .white
        self.countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countdownLabel)
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
        
        
        self.resetButton = UIButton(type: .system)
        self.resetButton.setTitle("Reset", for: .normal)
        self.resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.resetButton.tintColor = .black
        self.resetButton.layer.cornerRadius = 8
        self.resetButton.layer.masksToBounds = true
        self.resetButton.backgroundColor = UIColor.AppColor
        self.resetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resetButton)
        self.resetButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        self.resetButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30).isActive = true
        self.resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.resetButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 40).isActive = true
        self.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        
        
        self.pauseButton = UIButton(type: .system)
        self.pauseButton.setTitle("Pause", for: .normal)
        self.pauseButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.pauseButton.tintColor = .black
        self.pauseButton.layer.cornerRadius = 8
        self.pauseButton.layer.masksToBounds = true
        self.pauseButton.backgroundColor = UIColor.AppColor
        self.pauseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pauseButton)
        self.pauseButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        self.pauseButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30).isActive = true
        self.pauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.pauseButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 40).isActive = true
        self.pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped(){
        startCountdown()
    }
    
    @objc private func resetButtonTapped(){
        resetCountdown()
    }
    @objc private func pauseButtonTapped(){
        if isPaused{
            resumeCountdown()
        }
        else{
            pauseCountdown()
        }
       
    }
    private func startCountdown(){
        startButton.isEnabled = false
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
        
        isPaused = false
        pauseButton.setTitle("Pause", for: .normal)
    }
    private func resetCountdown(){
        startButton.isEnabled = true
        
        timer?.invalidate()
        
        remainingTime = 10
        countdownLabel.text = "\(remainingTime)"
        
        isPaused = false
        pauseButton.setTitle("Pause", for: .normal)
    }
    private func pauseCountdown(){
       // startButton.isEnabled = true
        
        timer?.invalidate()
        
        isPaused = true
        pauseButton.setTitle("Resume", for: .normal)
    }
    
    private func resumeCountdown(){
        startCountdown()
    }
    
    @objc private func updateCountDown() {
        if remainingTime > 0 {
            countdownLabel.text = "\(remainingTime)"
            remainingTime -= 1
        }
        else{
            countdownLabel.text = "Good Job!"
            
            startButton.isEnabled = true
            
            timer?.invalidate()
            isPaused = false
            pauseButton.setTitle("Pause", for: .normal)
        }
    }
    

}
