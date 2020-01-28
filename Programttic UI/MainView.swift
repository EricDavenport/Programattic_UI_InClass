//
//  MainView.swift
//  Programttic UI
//
//  Created by Eric Davenport on 1/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class MainView: UIView {
  
  let defaultMessage = "No default color set. Please go to settings"
  var choice = false
  
  // MARK: create a label
  // lazy makes sure instance will not be called until required
  public lazy var messageLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .black
    label.textColor = .white
    label.textAlignment = .center
    label.text = defaultMessage
    return label
  }()   // () creates a closure and calls simultaneously   --
  // TODO: sytax terminolo                    gy
  /*  MARK: lazy var issue
   fails because attwempts to create message/text immediately
   var someLabel: UILabel = {
   let label = UILabel
   label.text = defaultMessage     // DOES NOT COMPLIE
   return label
   }()
   */
  
  public lazy var randomObject: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .green
    imageView.image = UIImage(systemName: "pencil.slash")
    //    imageView.bounds.height =
    return imageView
  }()
  
  public lazy var randomObject2: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .magenta
    return tableView
  }()
  
  // MARK: create a button
  public lazy var resetButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .cyan
    button.setTitle("reset", for: .normal)
    button.setTitleColor(.systemRed, for: .normal)      // for: .normal - means state of button - pressed, highlighted, normal
    return button
  }()
  
  // init(frame: ) gets called if view is done progromattically
  override init(frame: CGRect){
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  // if this view get initialized from storyboard
  // this initializer gets called
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    messageLabelContraints()
    resetButtonContraint()
    //switchConstraints()
    randomConstraints()
  }
  
  private func  messageLabelContraints() {
    // adds the messagelLabel to the view
    addSubview(messageLabel)  // returns the message label object created above
    
    // set constraints for the messageLabel
    // must set translatesAutoresizingMaskIntoConstraints to false in order to constraint object
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      // set top anchor to 20 points from the safe area top
      messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      
      // set padding at the leading edge of the MainView
      messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      
      // set padding at the trailiing edge of the MainView
      messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    ])
  }
  
  private func resetButtonContraint() {
    // steps for adding contrains programmatically
    // 1. add subview - addSubview(object)
    addSubview(resetButton)
    
    // 2. set translatesAutoresizingMaskIntoConstraints for object to false
    resetButton.translatesAutoresizingMaskIntoConstraints = false
    
    // 3. set constraints
    NSLayoutConstraint.activate([
      // center horizontal axis
      resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      // top constraing
      resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40)
      
      // resetButton.centerYAnchor.constraint(equalTo: centerYAnchor) -- center vertically
    ])
  }
  
  private func switchConstraints() {
    addSubview(randomObject)
    
    randomObject.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      randomObject.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 45),
      // randomObject.centerXAnchor.constraint(equalTo: centerXAnchor)
      randomObject.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      randomObject.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      randomObject.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      
      
      
      
    ])
    randomObject.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    randomObject.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
  }
  
  
  private func randomConstraints() {
    addSubview(randomObject2)
    randomObject2.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      randomObject2.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 10),
      randomObject2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
      randomObject2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      randomObject2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
    
  }
  
  
}
