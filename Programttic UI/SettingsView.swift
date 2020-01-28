//
//  SettingsView.swift
//  Programttic UI
//
//  Created by Eric Davenport on 1/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class SettingsView: UIView {
  
  // lazy property initializer
  public lazy var pickerView: UIPickerView = {
    let pv = UIPickerView()
    return pv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    // addSubviews
    pickerViewContraints()
  }
  
  private func pickerViewContraints() {
    // 1.
    addSubview(pickerView)
    // 2. translateAutoresizinhMaskIntoConstraints to false
    pickerView.translatesAutoresizingMaskIntoConstraints = false
    // 3. setup constraints
    NSLayoutConstraint.activate([
      pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
      pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
}
