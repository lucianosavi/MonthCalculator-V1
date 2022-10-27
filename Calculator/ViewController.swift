//
//  ViewController.swift
//  MonthCalculator  V1
//
//  Created by user220270 on 10/25/22.
//

import UIKit

class ViewController: UIViewController {
    
    static var shared = ViewController()
    
    
    
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .systemCyan
        return textField
    }()
    
    
    lazy var pickerTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "digite o mês inicial"
        textField.inputView = monthPicker
        
        
        return textField
    }()
    
    
    
    lazy var parcelTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "digite a quantidade de parcelas"
        textField.textColor = .systemCyan
        return textField
    }()
    
    lazy var submitButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        
        button.addTarget(self, action: #selector(saveValue), for: .touchUpInside)
        
        return button
    }()
    
    lazy var monthPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .clear
        pickerView.delegate = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
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
        
        let stackView = UIStackView(arrangedSubviews: [valueTextField,pickerTextField,parcelTextField,submitButton])
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
    
    @objc func saveValue() {
        
        guard let intValue = Int(valueTextField.text ?? "0") else {
            print("Unable to unwrap value")
            return
        }
        guard let parcelsNumber = Int(parcelTextField.text ?? "0") else {
            print("Unable to unwrap parcels")
            return
        }
        Values.shared.valueInput = intValue
        Values.shared.parcels = parcelsNumber
        CalculatorViewModel.shared.getMonth()
        print("teste picker",Month.shared.month,Values.shared.parcels)
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
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Month.shared.pickerOptions.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Month.shared.pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let chooseOption: String = Month.shared.pickerOptions[row]
        Month.shared.month = chooseOption
        pickerTextField.text = chooseOption
        
    }
}

