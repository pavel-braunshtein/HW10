

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: SignUpView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscrubeNotifications()
        
        let textFields: [UITextField] = [
            contentView.firstNameTextField,
            contentView.lastNameTextField,
            contentView.emailNameTextField,
            contentView.passwordTextField,
            contentView.confirmPasswordTextField,
            contentView.countryTextField,
            contentView.cityTextField,
            contentView.addressTextField,
            contentView.cardNumberTextField,
            contentView.expDateTextField,
            contentView.cvvTextField
        ]
        
        textFields.forEach { $0.delegate = self }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        view.endEditing(true)
    }
    
}


extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  
        if textField == contentView.cvvTextField {
            let maxLength = 3
            return shouldLimitText(textField: textField, range: range, replacementString: string, maxLength: maxLength)
        } else if textField == contentView.cardNumberTextField {
            let maxLength = 16
            return shouldLimitText(textField: textField, range: range, replacementString: string, maxLength: maxLength)
        }
        return true
    }
    
    func shouldLimitText(textField: UITextField, range: NSRange, replacementString string: String, maxLength: Int) -> Bool {
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return newText.count <= maxLength
    }
}
