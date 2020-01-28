//
//  ViewController.swift
//  Programttic UI
//
//  Created by Gregory Keeley on 1/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private var  change : Bool = false
  
  private let mainView = MainView()
  /*
   if doing programattic UI implement and setup the view
   in loadView()
   loadView() gets called before viewDidLoad()
   loadView() sets up the initial view of the controller
   do not call super when overriding loadView()
   */
  override func loadView() {
    view = mainView
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    updateAppColor()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    // Set title of navigation bar
    configureNavBar()
    
    // add target/ action for reset button
    mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)
    updateAppColor()
  }
  
  private func updateAppColor() {
    if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
      view.backgroundColor = UIColor(named: colorName)
    } else {
      view.backgroundColor = .black
    }
  }
  
  private func configureNavBar() {
    navigationItem.title = "Programmatic UI"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
  }
  
  @objc
  private func showSettings(_ sender: UIBarButtonItem) {
    // segue to the settings view controller
    let settingsVC = SettingsViewController()
    //        present(settingsVC, animated: true)
    //        settingsVC.modalPresentationStyle = .automatic
    //        settingsVC.modalTransitionStyle = .crossDissolve
    navigationController?.pushViewController(settingsVC, animated: true)
  }
  @objc
  private func resetAppColor(_ sender: UIButton) {
    //view.backgroundColor = .brown
    changeBool()
    changeColor()
    print("reset app color - brown")
  }
  
  private func changeBool() {
    if change == false {
      change = true
    } else {
      change = false
    }
  }
  
  private func changeColor() {
    if change {
      view.backgroundColor = .orange
      mainView.resetButton.backgroundColor = .blue
      mainView.resetButton.setTitleColor(.white, for: .normal)
      mainView.messageLabel.text = "background changed to blue"
      mainView.messageLabel.textColor = .white
      mainView.messageLabel.backgroundColor = .blue
      mainView.randomObject2.backgroundColor = .blue
      
    } else {
      view.backgroundColor = .black
      mainView.messageLabel.text = "background changed to black"
      mainView.resetButton.backgroundColor = .orange
      mainView.resetButton.setTitleColor(.black, for: .normal)
      mainView.messageLabel.backgroundColor = .orange
      mainView.messageLabel.textColor = .black
      mainView.randomObject2.backgroundColor = .orange
      
      
    }
  }
  
}

