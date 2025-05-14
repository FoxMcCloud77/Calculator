import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonPressedAnimation(_ sender: UIButton) {
        
        let buttonBgColor = sender.backgroundColor
        sender.backgroundColor = .lightGray
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            sender.backgroundColor = buttonBgColor
        }
    }
}

