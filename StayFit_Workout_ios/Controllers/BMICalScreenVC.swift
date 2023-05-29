//
//  BMICalScreenVC.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-10.
//
import UIKit
//import Firebase

class BMICalScreenVC: UIViewController {
    
  //  var viewModel = UserProfileViewModel()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PROFILE"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
        
    }()
    
    let Weight: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .decimalPad
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textColor = .white
        textfield.textAlignment = .center
        return textfield
    }()
    let Height: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .decimalPad
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textColor = .white
        textfield.textAlignment = .center
        return textfield
    }()
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.view.backgroundColor = .black
        view.addSubview(titleLabel)
        setWeight()
        setHeight()
        setUserProfileButton()
        setLabel()
        calculateButton.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
//        Age.text = viewModel.user.age
//        Weight.text = viewModel.user.weight
//        Height.text = viewModel.user.height
    }
    
    func setLabel(){
        self.view.addSubview(titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
        ])
    }
    func setWeight (){
        self.view.addSubview(Weight)
        self.Weight.backgroundColor = UIColor.FieldColor
        self.Weight.attributedPlaceholder = NSAttributedString(string: "Weight (Kg)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.Weight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.Weight.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.Weight.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.Weight.heightAnchor.constraint(equalToConstant: 50),
            self.Weight.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
        ])
    
    }
    
    func setHeight (){
        self.view.addSubview(Height)
        self.Height.backgroundColor = UIColor.FieldColor
        self.Height.attributedPlaceholder = NSAttributedString(string: "Height (cm)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.Height.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.Height.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.Height.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.Height.heightAnchor.constraint(equalToConstant: 50),
            self.Height.topAnchor.constraint(equalTo: Weight.bottomAnchor, constant: 30),
        ])
    
    }
    
    func setUserProfileButton(){
        self.view.addSubview(calculateButton)
        self.calculateButton.backgroundColor = UIColor.AppColor
        self.calculateButton.setAttributedTitle(customProfileButton, for: .normal)
        //self.CreateProfile.addTarget(self, action:#selector(nextButtonTapped), for: .touchUpInside)
      //  self.calculateButton.addTarget(self, action: #selector(gotoWorkoutList), for: .touchUpInside)
        self.calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.calculateButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 50),
            self.calculateButton.topAnchor.constraint(equalTo: Height.bottomAnchor, constant: 40),
        ])
        }
    
    @objc private func calculateBMI(){
        guard let weightText = Weight.text,
              let weight = Double(weightText),
              let heightText = Height.text,
              let height = Double(heightText) else {
            displayError()
            return
        }
        let heightInMeter = height / 100
        let bmi = weight / (heightInMeter * heightInMeter)
        
        if bmi < 18.5 {
            let resultVC = HomepageWGVC(bmiValue:bmi)
            navigationController?.pushViewController(resultVC, animated: true)
        }
        
        else {
            let resultVC = HomepageVC(bmiValue:bmi)
            navigationController?.pushViewController(resultVC, animated: true)
        }
       
    }
    
    private func displayError(){
        let alert = UIAlertController(title: "Invalid Input", message: "Please enter valid weight and height values", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
//    @objc func gotoWorkoutList (){
//           let workoutlist = WorkoutList()
//            navigationController?.pushViewController(workoutlist, animated:true)
//        }
//
    let customProfileButton = NSMutableAttributedString(string: "Next", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])
    
//    @objc func nextButtonTapped(){
//        viewModel.save()
//    }

}
