// MARK: - Mocks generated from file: Memoria/Features/Destination/Domain/Repositories/DestinationRepository.swift at 2023-04-28 15:10:57 +0000

//
//  File.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Cuckoo
@testable import Memoria

import Combine
import Foundation






 class MockDestinationRepository: DestinationRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = DestinationRepository
    
     typealias Stubbing = __StubbingProxy_DestinationRepository
     typealias Verification = __VerificationProxy_DestinationRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: DestinationRepository?

     func enableDefaultImplementation(_ stub: DestinationRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func fetchArea() -> AnyPublisher<[Area], Failure> {
        
    return cuckoo_manager.call(
    """
    fetchArea() -> AnyPublisher<[Area], Failure>
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchArea())
        
    }
    
    
    
    
    
     func fetchDestination(area: Area) -> AnyPublisher <[Destination], Failure> {
        
    return cuckoo_manager.call(
    """
    fetchDestination(area: Area) -> AnyPublisher <[Destination], Failure>
    """,
            parameters: (area),
            escapingParameters: (area),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchDestination(area: area))
        
    }
    
    

     struct __StubbingProxy_DestinationRepository: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func fetchArea() -> Cuckoo.ProtocolStubFunction<(), AnyPublisher<[Area], Failure>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockDestinationRepository.self, method:
    """
    fetchArea() -> AnyPublisher<[Area], Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func fetchDestination<M1: Cuckoo.Matchable>(area: M1) -> Cuckoo.ProtocolStubFunction<(Area), AnyPublisher <[Destination], Failure>> where M1.MatchedType == Area {
            let matchers: [Cuckoo.ParameterMatcher<(Area)>] = [wrap(matchable: area) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockDestinationRepository.self, method:
    """
    fetchDestination(area: Area) -> AnyPublisher <[Destination], Failure>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_DestinationRepository: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func fetchArea() -> Cuckoo.__DoNotUse<(), AnyPublisher<[Area], Failure>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    fetchArea() -> AnyPublisher<[Area], Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func fetchDestination<M1: Cuckoo.Matchable>(area: M1) -> Cuckoo.__DoNotUse<(Area), AnyPublisher <[Destination], Failure>> where M1.MatchedType == Area {
            let matchers: [Cuckoo.ParameterMatcher<(Area)>] = [wrap(matchable: area) { $0 }]
            return cuckoo_manager.verify(
    """
    fetchDestination(area: Area) -> AnyPublisher <[Destination], Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class DestinationRepositoryStub: DestinationRepository {
    

    

    
    
    
    
     func fetchArea() -> AnyPublisher<[Area], Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[Area], Failure>).self)
    }
    
    
    
    
    
     func fetchDestination(area: Area) -> AnyPublisher <[Destination], Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher <[Destination], Failure>).self)
    }
    
    
}





// MARK: - Mocks generated from file: Memoria/Features/ImageGenerator/Domain/DestinationImageGenerator.swift at 2023-04-28 15:10:57 +0000

//
//  DestinationImageGenerator.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 21/04/23.
//

import Cuckoo
@testable import Memoria

import Combine
import CoreImage
import UIKit






 class MockDestinationImageGenerator: DestinationImageGenerator, Cuckoo.ProtocolMock {
    
     typealias MocksType = DestinationImageGenerator
    
     typealias Stubbing = __StubbingProxy_DestinationImageGenerator
     typealias Verification = __VerificationProxy_DestinationImageGenerator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: DestinationImageGenerator?

     func enableDefaultImplementation(_ stub: DestinationImageGenerator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure> {
        
    return cuckoo_manager.call(
    """
    generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>
    """,
            parameters: (from, to),
            escapingParameters: (from, to),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.generateDestinationImage(from: from, to: to))
        
    }
    
    

     struct __StubbingProxy_DestinationImageGenerator: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func generateDestinationImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from: M1, to: M2) -> Cuckoo.ProtocolStubFunction<(UIImage, UIImage), AnyPublisher<UIImage, Failure>> where M1.MatchedType == UIImage, M2.MatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage, UIImage)>] = [wrap(matchable: from) { $0.0 }, wrap(matchable: to) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockDestinationImageGenerator.self, method:
    """
    generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_DestinationImageGenerator: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func generateDestinationImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from: M1, to: M2) -> Cuckoo.__DoNotUse<(UIImage, UIImage), AnyPublisher<UIImage, Failure>> where M1.MatchedType == UIImage, M2.MatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage, UIImage)>] = [wrap(matchable: from) { $0.0 }, wrap(matchable: to) { $0.1 }]
            return cuckoo_manager.verify(
    """
    generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class DestinationImageGeneratorStub: DestinationImageGenerator {
    

    

    
    
    
    
     func generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<UIImage, Failure>).self)
    }
    
    
}










 class MockDestinationImageGeneratorImpl: DestinationImageGeneratorImpl, Cuckoo.ClassMock {
    
     typealias MocksType = DestinationImageGeneratorImpl
    
     typealias Stubbing = __StubbingProxy_DestinationImageGeneratorImpl
     typealias Verification = __VerificationProxy_DestinationImageGeneratorImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: DestinationImageGeneratorImpl?

     func enableDefaultImplementation(_ stub: DestinationImageGeneratorImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure> {
        
    return cuckoo_manager.call(
    """
    generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>
    """,
            parameters: (from, to),
            escapingParameters: (from, to),
            superclassCall:
                
                super.generateDestinationImage(from: from, to: to)
                ,
            defaultCall: __defaultImplStub!.generateDestinationImage(from: from, to: to))
        
    }
    
    

     struct __StubbingProxy_DestinationImageGeneratorImpl: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func generateDestinationImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from: M1, to: M2) -> Cuckoo.ClassStubFunction<(UIImage, UIImage), AnyPublisher<UIImage, Failure>> where M1.MatchedType == UIImage, M2.MatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage, UIImage)>] = [wrap(matchable: from) { $0.0 }, wrap(matchable: to) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockDestinationImageGeneratorImpl.self, method:
    """
    generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_DestinationImageGeneratorImpl: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func generateDestinationImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from: M1, to: M2) -> Cuckoo.__DoNotUse<(UIImage, UIImage), AnyPublisher<UIImage, Failure>> where M1.MatchedType == UIImage, M2.MatchedType == UIImage {
            let matchers: [Cuckoo.ParameterMatcher<(UIImage, UIImage)>] = [wrap(matchable: from) { $0.0 }, wrap(matchable: to) { $0.1 }]
            return cuckoo_manager.verify(
    """
    generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class DestinationImageGeneratorImplStub: DestinationImageGeneratorImpl {
    

    

    
    
    
    
     override func generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<UIImage, Failure>).self)
    }
    
    
}





// MARK: - Mocks generated from file: Memoria/Features/ImageGenerator/Domain/ImageSegmentor.swift at 2023-04-28 15:10:57 +0000

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





// MARK: - Mocks generated from file: Memoria/Features/Scrapbook/Domain/Repositories/ScrapBookRepository.swift at 2023-04-28 15:10:57 +0000

//
//  ScrapBookRepository.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 28/04/23.
//

import Cuckoo
@testable import Memoria

import Combine
import Foundation

    
}




