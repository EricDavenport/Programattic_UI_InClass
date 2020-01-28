//
//  SettingsViewController.swift
//  Programttic UI
//
//  Created by Gregory Keeley on 1/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

struct AppKey {
  static let appColorKey = "app color"
}

class SettingsViewController: UIViewController {
  
  private let settingsView = SettingsView()
  
  // data for pickerView
  let colors = ["Bubblegum", "Green", "Blue", "Orange", "Red", "Cyan", "Sky", "White", "Yellow", "Lime"]
  
  override func loadView() {
    view = settingsView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String
    view.backgroundColor = UIColor(named: colorName!)
    
    settingsView.pickerView.dataSource = self
    settingsView.pickerView.delegate = self
  }
  
}

extension SettingsViewController : UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    colors.count
  }
}

extension SettingsViewController : UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return colors[row]
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let colorName = colors[row]
    view.backgroundColor = UIColor(named: colorName )
    
    // will save colorName to userDefaults
    UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
  }
}

