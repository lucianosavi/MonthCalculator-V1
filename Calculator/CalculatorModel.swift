//
//  CalculatorModel.swift
//  MonthCalculator  V1
//
//  Created by user220270 on 10/25/22.
//

import Foundation

struct Values{
    var valueInput:Int?
    var parcels:Int?
    static var shared = Values()
       

       private init() { }
       
    }
struct Month {
     var pickerOptions: [String] = ["Escolha o mes","Janeiro", "Fevereiro", "Março", "Abril", "Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"]
    var month = ""
    
    static var shared = Month()
       

       private init() { }
}
