//
//  main.swift
//  lesson_1
//
//  Created by admin on 28/03/2019.
//  Copyright © 2019 mshchegolev. All rights reserved.
//

import Foundation
var alphavitik = ["А","Б","В","Г","Д","Е","Ё","Ж","З","И","Й","К","Л","М","Н","О","П","Р","С","Т","У","Ф","Х","Ц","Ч","Ш","Щ","Ъ","Ы","Ь","Э","Ю","Я"]

var dict = [Character: Double]()
var index = 1
for value in alphavitik{
    let koef = 4 * pow(Double(1.1),Double(index)-1) - 3
    dict[Character(value)] = koef
    index+=1
}
func famaly(familiya: String)  -> Double{
    var res : Double = 0.0
    //var indexBukv = 1
    var podschetBukv = [Character : Int]()
    for bukva in familiya{
        switch podschetBukv[bukva]{
        case nil:
            podschetBukv[bukva] = 1
            if let znachenieBukvi = dict[bukva]{
                res += znachenieBukvi
            }
        default:
            podschetBukv[bukva]! += 1
            if let znachenieBukvi = dict[bukva]{
                res += znachenieBukvi * Double(podschetBukv[bukva]!)
            }
        }
    //print(res)
    }
    return res
}



func calc_name(name: String, workFor: String ) -> Double{
    var res : Double = 0.0
    var firstLetter : Double = 0.0
    var podshetBukv = [Character : Int]()
    for bukva in name{
        switch podshetBukv[bukva]{
        case nil:
            podshetBukv[bukva] = 1
            if podshetBukv.count == 1 {
                let znachenieBukvi = dict[bukva]
                firstLetter = Double(znachenieBukvi!)
                res += firstLetter
            }
            else{
                let znachenieBukvi = dict[bukva]
                res += firstLetter - znachenieBukvi!
            }
            
            
        default:
            podshetBukv[bukva]! += 1
            if let znachenieBukvi = dict[bukva]{
                if workFor.contains("heart"){
                    res += znachenieBukvi * 2
                } else{
                   // res += znachenieBukvi / znachenieBukvi
                }
            }
        }
    }
    return res
}


func calc_surname(otchestvo: String) -> Double{
    var res : Double = 1.0
    var podschetBukv = [Character : Int]()
    for bukva in otchestvo{
        switch podschetBukv[bukva]{
        case nil:
            podschetBukv[bukva] = 1
            if let znachenieBukvi = dict[bukva]{
                res *= znachenieBukvi
            }
        default:
            podschetBukv[bukva]! += 1
        }
    }
    return res
}

let fio = famaly(familiya: "ЩЕГОЛЕВ") + calc_name(name: "МИХАИЛ",workFor: "mind") + calc_surname(otchestvo:"ВЛАДИМИРОВИЧ")
var t = Array(String(Int(fio))).count
for z in Array(String(Int(fio))){
    t-=1
    print(z, terminator : " ")
    if t > 0 {
    for _ in 1...t{
        print("10",terminator : " ")
    }
    }
    
    
    print("")
}
