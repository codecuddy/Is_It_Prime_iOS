//
//  ViewController.swift
//  is it prime
//
//  Created by Charlie Cuddy on 10/22/17.
//  Copyright © 2017 Charlie Cuddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumber: UITextField!
    
    @IBOutlet weak var outputResult: UILabel!
    
    @IBOutlet weak var outPutFactors: UILabel!
    
    @IBAction func isItPrimeButton(_ sender: Any) {
        print("button pressed")
        
        if let inputNumText = inputNumber.text {
            if let inputNumInt = Int(inputNumText) {
                if inputNumInt == 1  {
                    outputResult.text = "\(inputNumText) is not prime..."
                    outPutFactors.text = "Just except it!"
                    
                } else if inputNumInt < 1 {
                    outputResult.text = "\(inputNumText) is dumb... "
                    outPutFactors.text = "Pick another number."
                    
                } else {
                    let sqrtNumDub = Double(inputNumInt).squareRoot()
                    let sqrtInt = Int(sqrtNumDub)
                    var factors = [Int]()
                    var numberOfFactors = 0
                    
                    for num in 1...sqrtInt {
                        if inputNumInt % num == 0 {
                            numberOfFactors += 1
                            factors.append(num)
                            factors.append(inputNumInt / num)
                        }
                    }
                    
                    factors.sort()
                    print(factors)
                
                    if numberOfFactors == 1 {
                        outputResult.text = "\(inputNumText) is prime!"
                        outPutFactors.text = "1 and \(inputNumText) are the only two factors."
                    } else {
                        outputResult.text = "\(inputNumText) is not prime."
                        outPutFactors.text = "There are \(numberOfFactors * 2) total factors.\nThey are:\n\(factors)"
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

