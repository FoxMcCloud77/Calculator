import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var savedValue: Double = 0.0
    var result: Double = 0.0
    
    func formatResult(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(number))
        } else {
            return String(number)
        }
    }
    
    @IBAction func buttonPressedAnimation(_ sender: UIButton) {
        
        let buttonBgColor = sender.backgroundColor
        sender.backgroundColor = .lightGray
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            sender.backgroundColor = buttonBgColor
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            switch buttonText {
            case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
                if outputLabel.text == "0" {
                    if buttonText != "0" {
                        outputLabel.text = buttonText
                    }
                } else {
                    outputLabel.text = (outputLabel.text ?? "0") + buttonText
                }
                break
            case "AC":
                outputLabel.text = "0"
                resultLabel.text = ""
                break
            case ".":
                guard var currentText = outputLabel.text else {return}
                
                if !currentText.contains(".") {
                    currentText = currentText + buttonText
                } else {
                    currentText = currentText.replacingOccurrences(of: ".", with: "")
                }
                
                outputLabel.text = currentText
                break
            case "+/-":
                guard var currentText = outputLabel.text else {return}
                
                if currentText.hasPrefix("-") {
                    currentText = String(currentText.dropFirst())
                } else {
                    currentText = "-" + currentText
                }
                
                outputLabel.text = currentText
                break
            case "%":
                guard let currentText = outputLabel.text else {return}
                savedValue = Double(currentText)!
                result = savedValue / 100
                outputLabel.text = String(result)
                resultLabel.text = ""
                break
            case "+":
                guard let currentText = outputLabel.text else {return}
                savedValue = Double(currentText)!
                resultLabel.text = currentText + " + "
                outputLabel.text = "0"
                break
            case "-":
                guard let currentText = outputLabel.text else {return}
                savedValue = Double(currentText)!
                resultLabel.text = currentText + " - "
                outputLabel.text = "0"
                break
            case "x":
                guard let currentText = outputLabel.text else {return}
                savedValue = Double(currentText)!
                resultLabel.text = currentText + " x "
                outputLabel.text = "0"
                break
            case "÷":
                guard let currentText = outputLabel.text else {return}
                savedValue = Double(currentText)!
                resultLabel.text = currentText + " ÷ "
                outputLabel.text = "0"
                break
            case "=":
                guard let currentText = outputLabel.text else {return}
                if resultLabel.text!.contains("+") {
                    result = savedValue + Double(currentText)!
                    outputLabel.text = formatResult(result)
                    resultLabel.text = ""
                } else if resultLabel.text!.contains("÷") {
                    result = savedValue / Double(currentText)!
                    outputLabel.text = formatResult(result)
                    resultLabel.text = ""
                } else if resultLabel.text!.contains("x") {
                    result = savedValue * Double(currentText)!
                    outputLabel.text = formatResult(result)
                    resultLabel.text = ""
                } else if resultLabel.text!.contains("-") {
                    result = savedValue - Double(currentText)!
                    outputLabel.text = formatResult(result)
                    resultLabel.text = ""
                }
                break
            default:
                print("Invalid Input")
                break
            }
        }
    }
    
}
