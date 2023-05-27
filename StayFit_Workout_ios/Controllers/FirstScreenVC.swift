//
//  FirstScreenViewController.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-06.
//

import UIKit

class FirstScreenVC: UIViewController {

    let  StartButton = UIButton ()
    
    let ImageView: UIImageView = {
        let NewImageView = UIImageView()
        NewImageView.image = UIImage(named:"AppLogo")
        NewImageView.translatesAutoresizingMaskIntoConstraints = false
        return NewImageView
    
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        view.addSubview(ImageView)
        view.addSubview(StartButton)
        ImageViewConstraints()
        setStartButton()

    }
    
    func ImageViewConstraints(){
        ImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        ImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
    }
    
    func setStartButton(){
        
        StartButton.configuration = .filled()
        self.StartButton.configuration?.baseBackgroundColor = UIColor.AppColor
        StartButton.setAttributedTitle(customButton, for: .normal)
        StartButton.addTarget(self, action:#selector(goToLoginScreen), for: .touchUpInside)
    
        StartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            StartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120),
            StartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            StartButton.widthAnchor.constraint(equalToConstant: 250),
            StartButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    let customButton = NSMutableAttributedString(string: "Get Started", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
    ])
    
   @objc func goToLoginScreen (){
    let loginScreen = LoginScreenVC()
       navigationController?.pushViewController(loginScreen, animated:true)
    }


}
