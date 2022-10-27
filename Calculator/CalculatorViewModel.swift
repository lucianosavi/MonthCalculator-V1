//
//  CalculatorViewModel.swift
//  MonthCalculator  V1
//
//  Created by user220270 on 10/25/22.
//

import Foundation
class CalculatorViewModel {
    static let shared = CalculatorViewModel()
    
    func addData(month:String) {
        guard let value = Values.shared.valueInput else{
            print("Unable to unwrap on addData")
            return
        }
        guard let parcelsNumber = Values.shared.parcels else{
            print("Unable to unwrap on parcel")
            return
        }
        if UserDefaults.standard.value(forKey: month) != nil{
            
            for i in parcelsNumber...Month.shared.pickerOptions.count {
                print("teste")
            }
            
            let result = UserDefaults.standard.value(forKey: month) as! Int + value
            
            UserDefaults.standard.set(result, forKey: month)
            print("teste addValue",value,UserDefaults.standard.value(forKey: month),result)
        }else {
            UserDefaults.standard.set(value, forKey: month)
        }
    }
    
    func getMonth(){
        
        switch Month.shared.month {
            
        case "Janeiro":
            
            addData(month: "Janeiro")
            
        case "Fevereiro":
            
            addData(month: "Fevereiro")
            
        case "Março":
            
            addData(month: "Março")
            
        case "Abril":
            
            addData(month: "Abril")
            
        case "Junho":
            
            addData(month: "Junho")
            
        case "Julho":
            
            addData(month: "Julho")
            
        case "Agosto":
            
            addData(month: "Agosto")
            
        case "Setembro":
            
            addData(month: "Setembro")
            
        case "Outubro":
            
            addData(month: "Outubro")
            
        case "Novembro":
            
            addData(month: "Novembro")
            
        case "Dezembro":
            
            addData(month: "Dezembro")
            
            
        default :
            print("Unable to save")
            
        }
        
        
    }
    
}
