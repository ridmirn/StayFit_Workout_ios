//
//  CreateAccountVC.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-27.
//

import UIKit
//import Firebase
//import FirebaseAuth

class CreateAccountVC: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CREATE ACCOUNT"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
        
    }()
    let CAname: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textAlignment = .center
        return textfield
    }()
    
    let CAappleid: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textAlignment = .center
        return textfield
    }()
    
    let CApassword: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        return textfield
    }()
    let CreateNewAccountutton: UIButton = {
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
        setname()
        setappleID()
        setPassword()
        setCreateAccountButton()
        setLabel()

    }
    
    func setLabel(){
        self.view.addSubview(titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
        ])
    }
    func setname (){
        self.view.addSubview(CAname)
        self.CAname.backgroundColor = UIColor.FieldColor
        self.CAname.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.CAname.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.CAname.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.CAname.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.CAname.heightAnchor.constraint(equalToConstant: 50),
            self.CAname.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
        ])
    
    }
    func setappleID (){
        self.view.addSubview(CAappleid)
        self.CAappleid.backgroundColor = UIColor.FieldColor
        self.CAappleid.attributedPlaceholder = NSAttributedString(string: "Apple ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.CAappleid.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.CAappleid.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.CAappleid.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
        self.CAappleid.heightAnchor.constraint(equalToConstant: 50),
        self.CAappleid.topAnchor.constraint(equalTo: CAname.bottomAnchor, constant: 30),
        ])
    
    }
    
    func setPassword (){
        self.view.addSubview(CApassword)
        self.CApassword.backgroundColor = UIColor.FieldColor
        self.CApassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.CApassword.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.CApassword.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.CApassword.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.CApassword.heightAnchor.constraint(equalToConstant: 50),
            self.CApassword.topAnchor.constraint(equalTo: CAappleid.bottomAnchor, constant: 30),
        ])
    
    }
    func setCreateAccountButton(){
        self.view.addSubview(CreateNewAccountutton)
        self.CreateNewAccountutton.backgroundColor = UIColor.AppColor
        self.CreateNewAccountutton.setAttributedTitle(customNewAccountButton, for: .normal)
        //self.CreateNewAccountutton.addTarget(self, action:#selector(creactAccountTapped), for: .touchUpInside)
      
        self.CreateNewAccountutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.CreateNewAccountutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.CreateNewAccountutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.CreateNewAccountutton.heightAnchor.constraint(equalToConstant: 50),
            self.CreateNewAccountutton.topAnchor.constraint(equalTo: CApassword.bottomAnchor, constant: 40),
        ])
        
        }
    let customNewAccountButton = NSMutableAttributedString(string: "Create Account", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])
    
   // @objc func creactAccountTapped(){
     //      let username = CAname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       //    let email = CAappleid.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //   let password = CApassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         
           //Auth.auth().createUser(withEmail: email, password: password ){(result, err) in
               
             //  if err != nil {
             
             //      self.showError("error creating a user")
              // }
               //else{
                 //  let db = Firestore.firestore()
                  // db.collection("User_login").addDocument(data: ["name":username,"uid":result!.user.uid]) { (error) in
                       
                    //   if error != nil {
                      //     self.showError("Error saving user data")
                       //}
                  // }
                   ///hworkout
                //   self.userProfile()
               //}
           
          // }
      // }
       func showError(_ message: String){
           DispatchQueue.main.async{
               let alterController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
               alterController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
               self.present (alterController, animated: true, completion: nil)
               
           }
       }
       
//       func userProfile(){
//           let userprofile = UserProfileScreen()
//            navigationController?.pushViewController(userprofile, animated:true)
//
//       }

    
   

}
