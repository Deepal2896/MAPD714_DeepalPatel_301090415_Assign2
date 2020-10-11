//
//  ViewController.swift
//  MAPD714_DeepalPatel_301090415_Assign-2
//
//  Created by Deepal Patel on 2020-10-09.
//

import UIKit

class ViewController: UIViewController {

    var ans: String = ""
    var p_Num : Double = 0
    var c_Number : Double = 0
    var Tag = "+"
    let tagList = ["+","-","*","/","+/-"]
    var modOccured = false
    var decimal : Bool = false
    
    @IBOutlet weak var resultlabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func numButtonspressed(_ sender: UIButton)
    {
        if (resultlabel.text! == "0" || resultlabel.text! == "+" || resultlabel.text! == "-" || resultlabel.text! == "*" || resultlabel.text! == "/" || modOccured ) && !(sender.tag == 0) && !(sender.tag==100){
            resultlabel.text = String(sender.tag)
        }
        else if !(resultlabel.text! == "0") && !(sender.tag == 100){
            resultlabel.text = resultlabel.text! + String(sender.tag)
        }
        switch sender.titleLabel!.text!
        {
                case ".":
                    if(!resultlabel.text!.contains("."))
                    {
                        resultlabel.text! += "."
                    }
                default:
                    break
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton)
    {
        if p_Num==0 {
            p_Num = Double(resultlabel.text!) ?? 0
            decimal = false
        }
        else{
           // decimal = true
            c_Number = Double(resultlabel.text!) ?? 0
            if Tag == "+"{
                p_Num += c_Number
            }
            else if Tag == "-"{
                p_Num -= c_Number
            }
            else if Tag == "*"{
                p_Num *= c_Number
            }
            else if Tag == "/"{
                p_Num /= c_Number
            }
            
            
        }
        // sender.tag 4 is Percentage Button
        if sender.tag == 4{
            c_Number = Double(resultlabel.text!) ?? 0
            p_Num = c_Number/100
            modOccured = true
            decimal = true
        }
        
        if sender.tag == 10 || sender.tag == 4{
            decimal = true
            resultlabel.text = String(p_Num)
            p_Num = 0
            Tag = "+"
        }
        else{
            resultlabel.text = String(tagList[sender.tag])
            Tag = tagList[sender.tag]
        }
        
    }
    
    @IBAction func clearScreen(_ sender: UIButton)
    {
        ans = sender.titleLabel!.text!
        switch sender.titleLabel!.text! {
        case "C":
            resultlabel.text! = "0"
        case "<-":
            resultlabel.text!.popLast()
            if((resultlabel.text!.count < 1) || (resultlabel.text! == "-"))
            {
                resultlabel.text! = "0"
            }
        default:
            if(resultlabel.text == "0")
            {
                resultlabel.text! = sender.titleLabel!.text!
            }
            else
            {
                resultlabel.text! += sender.titleLabel!.text!
            }
        }
    }
 
    @IBAction func invertnum(_ sender: UIButton)
    {
        if(resultlabel.text! != "0")
        {
            if(!resultlabel.text!.contains("-"))
            {
                resultlabel.text!.insert("-", at: resultlabel.text!.startIndex)
            }
            else
            {
                resultlabel.text!.remove(at: resultlabel.text!.startIndex)
            }
        }
    }
}
