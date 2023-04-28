// MARK: - Mocks generated from file: Memoria/Features/ImageGenerator/Domain/ImageSegmentor.swift at 2023-04-28 10:26:27 AM +0000

//
//  ImageSegmentor.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import Cuckoo
@testable import Memoria

import Combine
import CoreImage
import UIKit
import Vision






 class MockImageSegmentor: ImageSegmentor, Cuckoo.ProtocolMock {
    
     typealias MocksType = ImageSegmentor
    
     typealias Stubbing = __StubbingProxy_ImageSegmentor
     typealias Verification = __VerificationProxy_ImageSegmentor

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ImageSegmentor?

     func enableDefaultImplementation(_ stub: ImageSegmentor) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure> {
        
    return cuckoo_manager.call(
    """
    detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>
    """,
            parameters: (input),
            escapingParameters: (input),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.detectPerson(input: input))
        
    }
    
    

     struct __StubbingProxy_ImageSegmentor: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func detectPerson<M1: Cuckoo.OptionalMatchable>(input: M1) -> Cuckoo.ProtocolStubFunction<(UIImage?), AnyPublisher<UIImage, Failure>> where M1.OptionalMatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage?)>] = [wrap(matchable: input) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockImageSegmentor.self, method:
    """
    detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ImageSegmentor: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func detectPerson<M1: Cuckoo.OptionalMatchable>(input: M1) -> Cuckoo.__DoNotUse<(UIImage?), AnyPublisher<UIImage, Failure>> where M1.OptionalMatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage?)>] = [wrap(matchable: input) { $0 }]
            return cuckoo_manager.verify(
    """
    detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ImageSegmentorStub: ImageSegmentor {
    

    

    
    
    
    
     func detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<UIImage, Failure>).self)
    }
    
    
}










 class MockImageSegmentorImpl: ImageSegmentorImpl, Cuckoo.ClassMock {
    
     typealias MocksType = ImageSegmentorImpl
    
     typealias Stubbing = __StubbingProxy_ImageSegmentorImpl
     typealias Verification = __VerificationProxy_ImageSegmentorImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ImageSegmentorImpl?

     func enableDefaultImplementation(_ stub: ImageSegmentorImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure> {
        
    return cuckoo_manager.call(
    """
    detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>
    """,
            parameters: (input),
            escapingParameters: (input),
            superclassCall:
                
                super.detectPerson(input: input)
                ,
            defaultCall: __defaultImplStub!.detectPerson(input: input))
        
    }
    
    

     struct __StubbingProxy_ImageSegmentorImpl: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func detectPerson<M1: Cuckoo.OptionalMatchable>(input: M1) -> Cuckoo.ClassStubFunction<(UIImage?), AnyPublisher<UIImage, Failure>> where M1.OptionalMatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage?)>] = [wrap(matchable: input) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockImageSegmentorImpl.self, method:
    """
    detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ImageSegmentorImpl: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func detectPerson<M1: Cuckoo.OptionalMatchable>(input: M1) -> Cuckoo.__DoNotUse<(UIImage?), AnyPublisher<UIImage, Failure>> where M1.OptionalMatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage?)>] = [wrap(matchable: input) { $0 }]
            return cuckoo_manager.verify(
    """
    detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ImageSegmentorImplStub: ImageSegmentorImpl {
    

    

    
    
    
    
     override func detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<UIImage, Failure>).self)
    }
    
    
}





// MARK: - Mocks generated from file: Memoria/Features/Scrapbook/Domain/Repositories/ScrapPageRepository.swift at 2023-04-28 10:26:27 AM +0000

//
//  ScrapPageEditor.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 27/04/23.
//

import Cuckoo
@testable import Memoria

import Combine
import Foundation






 class MockScrapPageRepository: ScrapPageRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = ScrapPageRepository
    
     typealias Stubbing = __StubbingProxy_ScrapPageRepository
     typealias Verification = __VerificationProxy_ScrapPageRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ScrapPageRepository?

     func enableDefaultImplementation(_ stub: ScrapPageRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func addScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure> {
        
    return cuckoo_manager.call(
    """
    addScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>
    """,
            parameters: (scrapPage),
            escapingParameters: (scrapPage),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.addScrapPage(scrapPage: scrapPage))
        
    }
    
    
    
    
    
     func editScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure> {
        
    return cuckoo_manager.call(
    """
    editScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>
    """,
            parameters: (scrapPage),
            escapingParameters: (scrapPage),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.editScrapPage(scrapPage: scrapPage))
        
    }
    
    
    
    
    
     func deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure> {
        
    return cuckoo_manager.call(
    """
    deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure>
    """,
            parameters: (scrapPage),
            escapingParameters: (scrapPage),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.deleteScrapPage(scrapPage: scrapPage))
        
    }
    
    

     struct __StubbingProxy_ScrapPageRepository: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func addScrapPage<M1: Cuckoo.Matchable>(scrapPage: M1) -> Cuckoo.ProtocolStubFunction<(ScrapPage), AnyPublisher<ScrapPage, Failure>> where M1.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage)>] = [wrap(matchable: scrapPage) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapPageRepository.self, method:
    """
    addScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func editScrapPage<M1: Cuckoo.Matchable>(scrapPage: M1) -> Cuckoo.ProtocolStubFunction<(ScrapPage), AnyPublisher<ScrapPage, Failure>> where M1.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage)>] = [wrap(matchable: scrapPage) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapPageRepository.self, method:
    """
    editScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func deleteScrapPage<M1: Cuckoo.Matchable>(scrapPage: M1) -> Cuckoo.ProtocolStubFunction<(ScrapPage), AnyPublisher<Void, Failure>> where M1.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage)>] = [wrap(matchable: scrapPage) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapPageRepository.self, method:
    """
    deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ScrapPageRepository: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func addScrapPage<M1: Cuckoo.Matchable>(scrapPage: M1) -> Cuckoo.__DoNotUse<(ScrapPage), AnyPublisher<ScrapPage, Failure>> where M1.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage)>] = [wrap(matchable: scrapPage) { $0 }]
            return cuckoo_manager.verify(
    """
    addScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func editScrapPage<M1: Cuckoo.Matchable>(scrapPage: M1) -> Cuckoo.__DoNotUse<(ScrapPage), AnyPublisher<ScrapPage, Failure>> where M1.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage)>] = [wrap(matchable: scrapPage) { $0 }]
            return cuckoo_manager.verify(
    """
    editScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func deleteScrapPage<M1: Cuckoo.Matchable>(scrapPage: M1) -> Cuckoo.__DoNotUse<(ScrapPage), AnyPublisher<Void, Failure>> where M1.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage)>] = [wrap(matchable: scrapPage) { $0 }]
            return cuckoo_manager.verify(
    """
    deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ScrapPageRepositoryStub: ScrapPageRepository {
    

    

    
    
    
    
     func addScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<ScrapPage, Failure>).self)
    }
    
    
    
    
    
     func editScrapPage(scrapPage: ScrapPage) -> AnyPublisher<ScrapPage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<ScrapPage, Failure>).self)
    }
    
    
    
    
    
     func deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Failure>).self)
    }
    
    
}




