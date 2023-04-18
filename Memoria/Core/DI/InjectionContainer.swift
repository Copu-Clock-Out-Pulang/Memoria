//
//  InjectionContainer.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import Foundation

import Foundation
import Swinject
import SwinjectAutoregistration

final class InjectionContainer {
    
    static let shared = InjectionContainer()
    private var _container: Container?
    
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        set {
            _container = newValue
        }
    }
    
    private func buildContainer() -> Container {
        let container = Container()
        //register component here
        
        return container;
    }
    
}
