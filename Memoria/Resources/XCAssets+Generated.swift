// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#elseif os(tvOS) || os(watchOS)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum I {
  internal static let accentButton = ColorAsset(name: "AccentButton")
  internal static let addScrapPageButtonIcon = ImageAsset(name: "AddScrapPageButtonIcon")
  internal enum Area {
    internal static let bekasi = ImageAsset(name: "Bekasi")
    internal static let bogor = ImageAsset(name: "Bogor")
    internal static let depok = ImageAsset(name: "Depok")
    internal static let jakarta = ImageAsset(name: "Jakarta")
    internal static let tangerang = ImageAsset(name: "Tangerang")
  }
  internal static let background = ColorAsset(name: "Background")
  internal static let backgroundOverlay = ColorAsset(name: "BackgroundOverlay")
  internal enum Bekasi {
    internal static let binaBangsa = ImageAsset(name: "BinaBangsa")
    internal static let gedungJuang = ImageAsset(name: "GedungJuang")
    internal static let rawaGede = ImageAsset(name: "RawaGede")
    internal static let snowWorld = ImageAsset(name: "SnowWorld")
    internal static let summarecon = ImageAsset(name: "Summarecon")
    internal static let transera = ImageAsset(name: "Transera")
  }
  internal enum Bogor {
    internal static let devoyage = ImageAsset(name: "Devoyage")
    internal static let jungleLand = ImageAsset(name: "JungleLand")
    internal static let jungleWaterpark = ImageAsset(name: "JungleWaterpark")
    internal static let kebunRaya = ImageAsset(name: "KebunRaya")
    internal static let mekarsari = ImageAsset(name: "Mekarsari")
    internal static let tamanSafari = ImageAsset(name: "TamanSafari")
  }
  internal enum CanvasColor {
    internal static let _0 = ColorAsset(name: "CanvasColor/0")
    internal static let _1 = ColorAsset(name: "CanvasColor/1")
    internal static let _2 = ColorAsset(name: "CanvasColor/2")
    internal static let _3 = ColorAsset(name: "CanvasColor/3")
    internal static let _4 = ColorAsset(name: "CanvasColor/4")
    internal static let _5 = ColorAsset(name: "CanvasColor/5")
    internal static let _6 = ColorAsset(name: "CanvasColor/6")
    internal static let _7 = ColorAsset(name: "CanvasColor/7")
  }
  internal static let checked = ImageAsset(name: "Checked")
  internal static let deleteButtonIcon = ImageAsset(name: "DeleteButtonIcon")
  internal enum Depok {
    internal static let alMahri = ImageAsset(name: "AlMahri")
    internal static let dkandang = ImageAsset(name: "Dkandang")
    internal static let godongijo = ImageAsset(name: "Godongijo")
    internal static let pasirPutih = ImageAsset(name: "PasirPutih")
    internal static let tamanLembah = ImageAsset(name: "TamanLembah")
    internal static let wiladatika = ImageAsset(name: "Wiladatika")
  }
  internal static let disabledButton = ColorAsset(name: "DisabledButton")
  internal static let editButtonIcon = ImageAsset(name: "EditButtonIcon")
  internal static let editScrapPageButtonIcon = ImageAsset(name: "EditScrapPageButtonIcon")
  internal static let familyIllustration = ImageAsset(name: "FamilyIllustration")
  internal enum Jakarta {
    internal static let dufan = ImageAsset(name: "Dufan")
    internal static let gbk = ImageAsset(name: "GBK")
    internal static let kotaTua = ImageAsset(name: "KotaTua")
    internal static let monas = ImageAsset(name: "Monas")
    internal static let ragunan = ImageAsset(name: "Ragunan")
    internal static let tmii = ImageAsset(name: "TMII")
  }
  internal static let phoneFrame = ImageAsset(name: "PhoneFrame")
  internal static let primaryButton = ColorAsset(name: "PrimaryButton")
  internal static let scrapBookDetailBackgroundDecal = ImageAsset(name: "ScrapBookDetailBackgroundDecal")
  internal static let scrapPageCard = ImageAsset(name: "ScrapPageCard")
  internal static let scrapPageEditorBackground = ImageAsset(name: "ScrapPageEditorBackground")
  internal static let scrapPageFilter = ImageAsset(name: "ScrapPageFilter")
  internal static let scrapPageThumbnailDummy = ImageAsset(name: "ScrapPageThumbnailDummy")
  internal static let scrapPageThumbnailNew = ImageAsset(name: "ScrapPageThumbnailNew")
  internal static let secondaryButton = ColorAsset(name: "SecondaryButton")
  internal enum Shape {
    internal static let _0 = ImageAsset(name: "Shape/0")
    internal static let _1 = ImageAsset(name: "Shape/1")
    internal static let _2 = ImageAsset(name: "Shape/2")
    internal static let _3 = ImageAsset(name: "Shape/3")
    internal static let _4 = ImageAsset(name: "Shape/4")
    internal static let _5 = ImageAsset(name: "Shape/5")
  }
  internal static let shareButtonIcon = ImageAsset(name: "ShareButtonIcon")
  internal static let splashBackground = ImageAsset(name: "SplashBackground")
  internal enum Sticker {
    internal static let _0 = ImageAsset(name: "Sticker/0")
    internal static let _1 = ImageAsset(name: "Sticker/1")
    internal static let _10 = ImageAsset(name: "Sticker/10")
    internal static let _11 = ImageAsset(name: "Sticker/11")
    internal static let _12 = ImageAsset(name: "Sticker/12")
    internal static let _13 = ImageAsset(name: "Sticker/13")
    internal static let _14 = ImageAsset(name: "Sticker/14")
    internal static let _2 = ImageAsset(name: "Sticker/2")
    internal static let _3 = ImageAsset(name: "Sticker/3")
    internal static let _4 = ImageAsset(name: "Sticker/4")
    internal static let _5 = ImageAsset(name: "Sticker/5")
    internal static let _6 = ImageAsset(name: "Sticker/6")
    internal static let _7 = ImageAsset(name: "Sticker/7")
    internal static let _8 = ImageAsset(name: "Sticker/8")
    internal static let _9 = ImageAsset(name: "Sticker/9")
  }
  internal enum Tangerang {
    internal static let bentengHeritage = ImageAsset(name: "BentengHeritage")
    internal static let boenTekBio = ImageAsset(name: "BoenTekBio")
    internal static let branchsto = ImageAsset(name: "Branchsto")
    internal static let oceanPark = ImageAsset(name: "OceanPark")
    internal static let scientia = ImageAsset(name: "Scientia")
    internal static let tamanPotret = ImageAsset(name: "TamanPotret")
  }
  internal static let textOnButton = ColorAsset(name: "TextOnButton")
  internal static let textPrimary = ColorAsset(name: "TextPrimary")
  internal static let textSecondary = ColorAsset(name: "TextSecondary")
  internal enum ToolBarIcon {
    internal static let background = ImageAsset(name: "ToolBarIcon/Background")
    internal static let photo = ImageAsset(name: "ToolBarIcon/Photo")
    internal static let scribble = ImageAsset(name: "ToolBarIcon/Scribble")
    internal static let shape = ImageAsset(name: "ToolBarIcon/Shape")
    internal static let sticker = ImageAsset(name: "ToolBarIcon/Sticker")
  }
  internal static let treeLeft = ImageAsset(name: "TreeLeft")
  internal static let treeRight = ImageAsset(name: "TreeRight")
  internal static let treeStraight = ImageAsset(name: "TreeStraight")
  internal enum TripBackgrounds {
    internal static let tripBackground1 = ImageAsset(name: "TripBackground1")
    internal static let tripBackground2 = ImageAsset(name: "TripBackground2")
    internal static let tripBackground3 = ImageAsset(name: "TripBackground3")
    internal static let tripBackground4 = ImageAsset(name: "TripBackground4")
    internal static let tripBackground5 = ImageAsset(name: "TripBackground5")
    internal static let tripBackground6 = ImageAsset(name: "TripBackground6")
  }
  internal static let unchecked = ImageAsset(name: "Unchecked")
  internal static let backgroundScrapBookDetail = ImageAsset(name: "backgroundScrapBookDetail")
  internal static let imageTest = ImageAsset(name: "image_test")
  internal static let instagram = ImageAsset(name: "instagram")
  internal static let mask = ImageAsset(name: "mask")
  internal static let outputTest = ImageAsset(name: "output_test")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
    internal fileprivate(set) var name: String

    #if os(macOS)
    internal typealias Color = NSColor
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Color = UIColor
    #endif

    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    internal private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()

    #if os(iOS) || os(tvOS)
    @available(iOS 11.0, tvOS 11.0, *)
    internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
        let bundle = BundleToken.bundle
        guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }
    #endif

    #if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
        SwiftUI.Color(asset: self)
    }()
    #endif

    fileprivate init(name: String) {
        self.name = name
    }
}

internal extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init?(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        self.init(named: NSColor.Name(asset.name), bundle: bundle)
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
    init(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        self.init(asset.name, bundle: bundle)
    }
}
#endif

internal struct ImageAsset {
    internal fileprivate(set) var name: String

    #if os(macOS)
    internal typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Image = UIImage
    #endif

    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
    internal var image: Image {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
        let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        let name = NSImage.Name(self.name)
        let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
        #elseif os(watchOS)
        let image = Image(named: name)
        #endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }

    #if os(iOS) || os(tvOS)
    @available(iOS 8.0, tvOS 9.0, *)
    internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
        let bundle = BundleToken.bundle
        guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }
    #endif

    #if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    internal var swiftUIImage: SwiftUI.Image {
        SwiftUI.Image(asset: self)
    }
    #endif
}

internal extension ImageAsset.Image {
    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
    @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init?(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
        let bundle = BundleToken.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
    init(asset: ImageAsset) {
        let bundle = BundleToken.bundle
        self.init(asset.name, bundle: bundle)
    }

    init(asset: ImageAsset, label: Text) {
        let bundle = BundleToken.bundle
        self.init(asset.name, bundle: bundle, label: label)
    }

    init(decorative asset: ImageAsset) {
        let bundle = BundleToken.bundle
        self.init(decorative: asset.name, bundle: bundle)
    }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: BundleToken.self)
        #endif
    }()
}
// swiftlint:enable convenience_type
