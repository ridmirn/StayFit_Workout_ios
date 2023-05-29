//
//  LoginScreenVC.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-06.
//

import Foundation
import UIKit

import FirebaseAuth
import FirebaseFirestore

class LoginScreenVC: UIViewController {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
        
    }()
    
    let appleid: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textColor = .white
        // textfield.placeholder = "Apple ID"
        textfield.textAlignment = .center
        return textfield
    }()
    
    let password: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textColor = .white
        //textfield.textContentType = .password
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    
    let NewAccountButton: UIButton = {
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
        setappleID()
        setPassword()
        setLoginButton()
        setNewAccountButton()
        setLabel()
    }
    
    func setLabel(){
        self.view.addSubview(titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
        ])
        
    }
    
    func setappleID (){
        self.view.addSubview(appleid)
        self.appleid.backgroundColor = UIColor.FieldColor
        self.appleid.attributedPlaceholder = NSAttributedString(string: "Apple ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.appleid.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.appleid.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.appleid.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.appleid.heightAnchor.constraint(equalToConstant: 50),
            self.appleid.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
        ])
        
    }
    
    func setPassword (){
        self.view.addSubview(password)
        self.password.backgroundColor = UIColor.FieldColor
        self.password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        self.password.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.password.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.password.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.password.heightAnchor.constraint(equalToConstant: 50),
            self.password.topAnchor.constraint(equalTo: appleid.bottomAnchor, constant: 30),
        ])
        
    }
    
    func setLoginButton(){
        self.view.addSubview(loginButton)
        self.loginButton.backgroundColor = UIColor.AppColor
        self.loginButton.setAttributedTitle(customLoginButton, for: .normal)
        self.loginButton.addTarget(self, action:#selector(loginTapped), for: .touchUpInside)
        
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 40),
        ])
    }
    
    func setNewAccountButton(){
        self.view.addSubview(NewAccountButton)
        self.NewAccountButton.backgroundColor = UIColor.AppColor
        self.NewAccountButton.setAttributedTitle(customNewAccountButton, for: .normal)
        
        self.NewAccountButton.addTarget(self, action:#selector(gotoNewAcoountScreen), for: .touchUpInside)
        
        self.NewAccountButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NewAccountButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            NewAccountButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            NewAccountButton.heightAnchor.constraint(equalToConstant: 50),
            NewAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
        ])
    }
    
    let customLoginButton = NSMutableAttributedString(string: "Login", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])
    let customNewAccountButton = NSMutableAttributedString(string: "Create Account", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])
    @objc func gotoNewAcoountScreen (){
        let newaccount = CreateAccountVC()
        navigationController?.pushViewController(newaccount, animated:true)
    }
    
    @objc func gotoProfileScreen (){
        let userprofile = BMICalScreenVC()
        navigationController?.pushViewController(userprofile, animated:true)
    }
    
    @objc func loginTapped(){
        let email = appleid.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password){
            (result, error) in
            if error != nil{
                self.showError("Invalid creditonals")
            }
            else{
                self.gotoProfileScreen()
            }
            
            
        }
    }
    
    
    
    func showError(_ message: String){
        DispatchQueue.main.async{
            let alterController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alterController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present (alterController, animated: true, completion: nil)
            
        }
    }
    
}
