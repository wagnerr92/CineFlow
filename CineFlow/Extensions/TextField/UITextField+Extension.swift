//
//  UITextField+Extension.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/11/24.
//

import UIKit

extension UITextField {
    func validateName(updateAll: String) -> Bool {
        let nameRegex = "[a-z0-9A-Z._!@#$&].{2,}$"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", nameRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validatePasswordCapitalLetter(updateAll: String) -> Bool {
        let passwordRegex = ".*[A-Z]+.*"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validatePasswordLowercaseletter(updateAll: String) -> Bool {
        let passwordRegex = ".*[a-z]+.*"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validatePasswordCharacters(updateAll: String) -> Bool {
        let passwordRegex = ".{8,}"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validatePasswordSpecialCharacters(updateAll: String) -> Bool {
        let passwordRegex = ".*[!@#$%^&*()_+-=\\[\\]{};':\"\\\\|,.<>/?`~§±©®™].*"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
}
