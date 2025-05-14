import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
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
                break
            case ".":
                guard var currentText = outputLabel.text else {return}
                
                if !currentText.contains(".") {
                    currentText = currentText + buttonText
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
                // FOR % SYMBOL in case =, use |input.split(separator: "%").first| to get only part before % symbol to avoid error.
                guard var currentText = outputLabel.text else {return}
                
                if !currentText.contains("%") {
                    currentText = currentText + "%"
                } else {
                    currentText = currentText.replacingOccurrences(of: "%", with: "")
                }
                
                outputLabel.text = currentText
                break
            default:
                break
            }
        }
    }
    
}
