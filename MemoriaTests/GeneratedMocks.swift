// MARK: - Mocks generated from file: Memoria/Features/Destination/Domain/Repositories/DestinationRepository.swift at 2023-05-06 17:44:58 +0000

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





// MARK: - Mocks generated from file: Memoria/Features/ImageGenerator/Domain/DestinationImageGenerator.swift at 2023-05-06 17:44:58 +0000

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





// MARK: - Mocks generated from file: Memoria/Features/ImageGenerator/Domain/ImageSegmentor.swift at 2023-05-06 17:44:58 +0000

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





// MARK: - Mocks generated from file: Memoria/Features/Scrapbook/Domain/Repositories/ScrapBookRepository.swift at 2023-05-06 17:44:58 +0000

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






 class MockScrapBookRepository: ScrapBookRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = ScrapBookRepository
    
     typealias Stubbing = __StubbingProxy_ScrapBookRepository
     typealias Verification = __VerificationProxy_ScrapBookRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ScrapBookRepository?

     func enableDefaultImplementation(_ stub: ScrapBookRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func createScrapBook(form: CreateScrapBookForm) -> AnyPublisher <ScrapBook, Failure> {
        
    return cuckoo_manager.call(
    """
    createScrapBook(form: CreateScrapBookForm) -> AnyPublisher <ScrapBook, Failure>
    """,
            parameters: (form),
            escapingParameters: (form),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.createScrapBook(form: form))
        
    }
    
    
    
    
    
     func getScrapBooks() -> AnyPublisher <[ScrapBook], Failure> {
        
    return cuckoo_manager.call(
    """
    getScrapBooks() -> AnyPublisher <[ScrapBook], Failure>
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getScrapBooks())
        
    }
    
    
    
    
    
     func editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher <ScrapBook, Failure> {
        
    return cuckoo_manager.call(
    """
    editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher <ScrapBook, Failure>
    """,
            parameters: (scrapBook, form),
            escapingParameters: (scrapBook, form),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.editScrapBook(scrapBook: scrapBook, form: form))
        
    }
    
    
    
    
    
     func deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher <(), Failure> {
        
    return cuckoo_manager.call(
    """
    deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher <(), Failure>
    """,
            parameters: (scrapBook),
            escapingParameters: (scrapBook),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.deleteScrapBook(scrapBook: scrapBook))
        
    }
    
    

     struct __StubbingProxy_ScrapBookRepository: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func createScrapBook<M1: Cuckoo.Matchable>(form: M1) -> Cuckoo.ProtocolStubFunction<(CreateScrapBookForm), AnyPublisher <ScrapBook, Failure>> where M1.MatchedType == CreateScrapBookForm {
            let matchers: [Cuckoo.ParameterMatcher<(CreateScrapBookForm)>] = [wrap(matchable: form) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapBookRepository.self, method:
    """
    createScrapBook(form: CreateScrapBookForm) -> AnyPublisher <ScrapBook, Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getScrapBooks() -> Cuckoo.ProtocolStubFunction<(), AnyPublisher <[ScrapBook], Failure>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockScrapBookRepository.self, method:
    """
    getScrapBooks() -> AnyPublisher <[ScrapBook], Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func editScrapBook<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(scrapBook: M1, form: M2) -> Cuckoo.ProtocolStubFunction<(ScrapBook, EditScrapBookForm), AnyPublisher <ScrapBook, Failure>> where M1.MatchedType == ScrapBook, M2.MatchedType == EditScrapBookForm {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapBook, EditScrapBookForm)>] = [wrap(matchable: scrapBook) { $0.0 }, wrap(matchable: form) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapBookRepository.self, method:
    """
    editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher <ScrapBook, Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func deleteScrapBook<M1: Cuckoo.Matchable>(scrapBook: M1) -> Cuckoo.ProtocolStubFunction<(ScrapBook), AnyPublisher <(), Failure>> where M1.MatchedType == ScrapBook {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapBook)>] = [wrap(matchable: scrapBook) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapBookRepository.self, method:
    """
    deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher <(), Failure>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ScrapBookRepository: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func createScrapBook<M1: Cuckoo.Matchable>(form: M1) -> Cuckoo.__DoNotUse<(CreateScrapBookForm), AnyPublisher <ScrapBook, Failure>> where M1.MatchedType == CreateScrapBookForm {
            let matchers: [Cuckoo.ParameterMatcher<(CreateScrapBookForm)>] = [wrap(matchable: form) { $0 }]
            return cuckoo_manager.verify(
    """
    createScrapBook(form: CreateScrapBookForm) -> AnyPublisher <ScrapBook, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getScrapBooks() -> Cuckoo.__DoNotUse<(), AnyPublisher <[ScrapBook], Failure>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    getScrapBooks() -> AnyPublisher <[ScrapBook], Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func editScrapBook<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(scrapBook: M1, form: M2) -> Cuckoo.__DoNotUse<(ScrapBook, EditScrapBookForm), AnyPublisher <ScrapBook, Failure>> where M1.MatchedType == ScrapBook, M2.MatchedType == EditScrapBookForm {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapBook, EditScrapBookForm)>] = [wrap(matchable: scrapBook) { $0.0 }, wrap(matchable: form) { $0.1 }]
            return cuckoo_manager.verify(
    """
    editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher <ScrapBook, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func deleteScrapBook<M1: Cuckoo.Matchable>(scrapBook: M1) -> Cuckoo.__DoNotUse<(ScrapBook), AnyPublisher <(), Failure>> where M1.MatchedType == ScrapBook {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapBook)>] = [wrap(matchable: scrapBook) { $0 }]
            return cuckoo_manager.verify(
    """
    deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher <(), Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ScrapBookRepositoryStub: ScrapBookRepository {
    

    

    
    
    
    
     func createScrapBook(form: CreateScrapBookForm) -> AnyPublisher <ScrapBook, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher <ScrapBook, Failure>).self)
    }
    
    
    
    
    
     func getScrapBooks() -> AnyPublisher <[ScrapBook], Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher <[ScrapBook], Failure>).self)
    }
    
    
    
    
    
     func editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher <ScrapBook, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher <ScrapBook, Failure>).self)
    }
    
    
    
    
    
     func deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher <(), Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher <(), Failure>).self)
    }
    
    
}





// MARK: - Mocks generated from file: Memoria/Features/Scrapbook/Domain/Repositories/ScrapPageRepository.swift at 2023-05-06 17:44:58 +0000

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
    

    

    

    
    
    
    
     func createScrapPage(form: CreateScrapPageForm, page: ScrapPage) -> AnyPublisher <ScrapPage, Failure> {
        
    return cuckoo_manager.call(
    """
    createScrapPage(form: CreateScrapPageForm, page: ScrapPage) -> AnyPublisher <ScrapPage, Failure>
    """,
            parameters: (form, page),
            escapingParameters: (form, page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.createScrapPage(form: form, page: page))
        
    }
    
    
    
    
    
     func getScrapPages() -> AnyPublisher<[ScrapPage], Failure> {
        
    return cuckoo_manager.call(
    """
    getScrapPages() -> AnyPublisher<[ScrapPage], Failure>
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getScrapPages())
        
    }
    
    
    
    
    
     func editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher <ScrapPage, Failure> {
        
    return cuckoo_manager.call(
    """
    editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher <ScrapPage, Failure>
    """,
            parameters: (scrapPage, form),
            escapingParameters: (scrapPage, form),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.editScrapPage(scrapPage: scrapPage, form: form))
        
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
        
        
        
        
        func createScrapPage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(form: M1, page: M2) -> Cuckoo.ProtocolStubFunction<(CreateScrapPageForm, ScrapPage), AnyPublisher <ScrapPage, Failure>> where M1.MatchedType == CreateScrapPageForm, M2.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(CreateScrapPageForm, ScrapPage)>] = [wrap(matchable: form) { $0.0 }, wrap(matchable: page) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapPageRepository.self, method:
    """
    createScrapPage(form: CreateScrapPageForm, page: ScrapPage) -> AnyPublisher <ScrapPage, Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getScrapPages() -> Cuckoo.ProtocolStubFunction<(), AnyPublisher<[ScrapPage], Failure>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockScrapPageRepository.self, method:
    """
    getScrapPages() -> AnyPublisher<[ScrapPage], Failure>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func editScrapPage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(scrapPage: M1, form: M2) -> Cuckoo.ProtocolStubFunction<(ScrapPage, EditScrapPageForm), AnyPublisher <ScrapPage, Failure>> where M1.MatchedType == ScrapPage, M2.MatchedType == EditScrapPageForm {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage, EditScrapPageForm)>] = [wrap(matchable: scrapPage) { $0.0 }, wrap(matchable: form) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockScrapPageRepository.self, method:
    """
    editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher <ScrapPage, Failure>
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
        func createScrapPage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(form: M1, page: M2) -> Cuckoo.__DoNotUse<(CreateScrapPageForm, ScrapPage), AnyPublisher <ScrapPage, Failure>> where M1.MatchedType == CreateScrapPageForm, M2.MatchedType == ScrapPage {
            let matchers: [Cuckoo.ParameterMatcher<(CreateScrapPageForm, ScrapPage)>] = [wrap(matchable: form) { $0.0 }, wrap(matchable: page) { $0.1 }]
            return cuckoo_manager.verify(
    """
    createScrapPage(form: CreateScrapPageForm, page: ScrapPage) -> AnyPublisher <ScrapPage, Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getScrapPages() -> Cuckoo.__DoNotUse<(), AnyPublisher<[ScrapPage], Failure>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    getScrapPages() -> AnyPublisher<[ScrapPage], Failure>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func editScrapPage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(scrapPage: M1, form: M2) -> Cuckoo.__DoNotUse<(ScrapPage, EditScrapPageForm), AnyPublisher <ScrapPage, Failure>> where M1.MatchedType == ScrapPage, M2.MatchedType == EditScrapPageForm {
            let matchers: [Cuckoo.ParameterMatcher<(ScrapPage, EditScrapPageForm)>] = [wrap(matchable: scrapPage) { $0.0 }, wrap(matchable: form) { $0.1 }]
            return cuckoo_manager.verify(
    """
    editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher <ScrapPage, Failure>
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
    

    

    
    
    
    
     func createScrapPage(form: CreateScrapPageForm, page: ScrapPage) -> AnyPublisher <ScrapPage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher <ScrapPage, Failure>).self)
    }
    
    
    
    
    
     func getScrapPages() -> AnyPublisher<[ScrapPage], Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[ScrapPage], Failure>).self)
    }
    
    
    
    
    
     func editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher <ScrapPage, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher <ScrapPage, Failure>).self)
    }
    
    
    
    
    
     func deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Failure>).self)
    }
    
    
}




