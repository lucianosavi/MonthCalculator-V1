//
//  ViewController.swift
//  MonthCalculator  V1
//
//  Created by user220270 on 10/25/22.
//

import UIKit

class ViewController: UIViewController {
  
        lazy var topLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Olá Luciano, seja bem vindo."
            label.textColor = .systemCyan
            return label
        }()
        
        lazy var emptyLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = " "
            label.textColor = .systemCyan
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 1
            
            
            return label
        }()
        
        lazy var thirdLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Aqui aparecerá as projeções dos meses"
            label.textColor = .systemCyan
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 1
           
            return label
        }()
        
        lazy var valueTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "digite o valor"
            
            textField.textColor = .systemCyan
            return textField
        }()
    
    lazy var monthTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "digite o mês"
        textField.textColor = .systemCyan
        return textField
    }()
        
        lazy var topStackView: UIStackView = {
            
            let stackView = UIStackView(arrangedSubviews: [topLabel,emptyLabel,thirdLabel])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillProportionally
            stackView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 25/255, alpha: 1)
            stackView.layer.cornerRadius = 5
            return stackView
        }()
        
        lazy var bottomStackView: UIStackView = {
            
            let stackView = UIStackView(arrangedSubviews: [valueTextField,monthTextField])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.distribution = .equalSpacing
            stackView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 25/255, alpha: 1)
            stackView.layer.cornerRadius = 5
            stackView.spacing = 50
            stackView.layoutMargins = UIEdgeInsets(top: 10, left: 13, bottom: 8, right: 13)
            return stackView
        }()
        
        
        
        override func viewDidLoad() {
           
            super.viewDidLoad()
            view.backgroundColor =  UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 1)
            
            view.addSubview(topStackView)
            view.addSubview(bottomStackView)
           
            setupConstrants()
            
        }
        
            
            func setupConstrants () {
                NSLayoutConstraint.activate([
                    
                    topStackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
                    topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    
                    topStackView.heightAnchor.constraint(equalToConstant: 150),
                    
                    
                    bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor,constant: 200),
                    bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    
                    
                ])
                
                
            }
            
        }
    

