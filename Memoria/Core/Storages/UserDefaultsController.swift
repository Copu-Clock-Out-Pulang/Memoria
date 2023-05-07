//
//  UserDefaultsController.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 05/05/23.
//

import Foundation


protocol UserDefaultController {
    func fetchIsNotFirstLaunch() -> Bool
    func setIsNotFirstLaunch()
    func isOnBoardingDisplayed() -> Bool
    func setIsOnBoardingDisplayed()
}
class UserDefaultsControllerImpl: UserDefaultController {

    let userDefault: UserDefaults
    init(userDefault: UserDefaults) {
        self.userDefault = userDefault
    }
    func fetchIsNotFirstLaunch() -> Bool {
        return userDefault.bool(forKey: "isNotFirst")
    }

    func setIsNotFirstLaunch() {
        userDefault.setValue(true, forKey: "isNotFirst")
    }

    func isOnBoardingDisplayed() -> Bool {
        return userDefault.bool(forKey: "isOnBoardingDisplayed")
    }
    
    func setIsOnBoardingDisplayed() {
        userDefault.set(true, forKey: "isOnBoardingDisplayed")
    }
    
}
