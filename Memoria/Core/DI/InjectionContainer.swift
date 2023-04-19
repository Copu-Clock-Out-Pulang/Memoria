//
//  InjectionContainer.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class InjectionContainer {
    
    static let shared = InjectionContainer()
    private var _container: Container?
    
    var container: Container {
        get {
            guard let contain = _container else {
                let newContainer = buildContainer()
                _container = newContainer
                return newContainer
            }
            return contain
        }
        set {
            _container = newValue
        }
    }
    
    private func buildContainer() -> Container {
        let container = Container()
        // register component here
        
        return container
    }
    
}
