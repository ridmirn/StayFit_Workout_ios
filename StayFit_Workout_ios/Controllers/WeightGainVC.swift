//
//  WeightGainVC.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-18.
//

import UIKit
import SDWebImage

class WeightGainVC: UIViewController {

    private var workouts = [Workout]()
  
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: "\(WorkoutTableViewCell.self)")
        tableView.rowHeight = 100
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWorkouts()
    }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            setupUI()
        }
    
    private func getWorkouts(){
        
        APICaller.shared.getWeightGain{ [weak self] result in
            switch result {
            case .success(let workouts):
                self?.workouts = workouts
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
          
        }
    }
}


extension WeightGainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(WorkoutTableViewCell.self)", for: indexPath) as! WorkoutTableViewCell
        let workout = workouts[indexPath.row]
        cell.workoutTitleLabel.text = workout.workout_name
        cell.workoutSubTitleLabel.text = "Duration:\t" + workout.duration + "\t Seconds"
        cell.workoutimageView.sd_setImage(with: URL(string: workout.image))
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         let workout = workouts[indexPath.row]
//         print(workout)
//         print(indexPath)
         
         let detailViewController = DetailWorkoutVC()
         detailViewController.workout = workout
         
         
         self.navigationController?.pushViewController(detailViewController, animated: true)
         
    }
}

private extension WeightGainVC{
    func setupUI() {
        title = "Weight Gain"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
}
