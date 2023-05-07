// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum S {
  /// Localizable.strings
  ///   Memoria
  /// 
  ///   Created by Adryan Eka Vandra on 19/04/23.
  internal static let appName = S.tr("Localizable", "appName", fallback: "Memoria")
  /// Add your family photo!
  internal static let dstAddYourFamilyPhoto = S.tr("Localizable", "dstAddYourFamilyPhoto", fallback: "Add your family photo!")
  /// Are you sure?
  internal static let dstAreYouSure = S.tr("Localizable", "dstAreYouSure", fallback: "Are you sure?")
  /// Choose your destination!
  internal static let dstChooseYourDestination = S.tr("Localizable", "dstChooseYourDestination", fallback: "Choose your destination!")
  /// Confirm Dialog
  internal static let dstConfirmDialog = S.tr("Localizable", "dstConfirmDialog", fallback: "Confirm Dialog")
  /// Create Your Trip
  internal static let dstCreateYourTrip = S.tr("Localizable", "dstCreateYourTrip", fallback: "Create Your Trip")
  /// e.g. 20 Jan - 6 Feb 2023
  internal static let dstDateExample = S.tr("Localizable", "dstDateExample", fallback: "e.g. 20 Jan - 6 Feb 2023")
  /// Done!
  internal static let dstDone = S.tr("Localizable", "dstDone", fallback: "Done!")
  /// Encourage yourself with some quote!
  internal static let dstEncourageYourSelf = S.tr("Localizable", "dstEncourageYourSelf", fallback: "Encourage yourself with some quote!")
  /// Next
  internal static let dstNext = S.tr("Localizable", "dstNext", fallback: "Next")
  /// No
  internal static let dstNo = S.tr("Localizable", "dstNo", fallback: "No")
  /// Pick a date
  internal static let dstPickADate = S.tr("Localizable", "dstPickADate", fallback: "Pick a date")
  /// Input quotes
  internal static let dstQuoteHint = S.tr("Localizable", "dstQuoteHint", fallback: "Input quotes")
  /// Random
  internal static let dstRandom = S.tr("Localizable", "dstRandom", fallback: "Random")
  /// Save
  internal static let dstSave = S.tr("Localizable", "dstSave", fallback: "Save")
  /// Select from gallery
  internal static let dstSelectFromGallery = S.tr("Localizable", "dstSelectFromGallery", fallback: "Select from gallery")
  /// Take photo
  internal static let dstTakePhoto = S.tr("Localizable", "dstTakePhoto", fallback: "Take photo")
  /// Input trip name
  internal static let dstTripInputHint = S.tr("Localizable", "dstTripInputHint", fallback: "Input trip name")
  /// When do you want to go?
  internal static let dstWhenDoYouWantToGo = S.tr("Localizable", "dstWhenDoYouWantToGo", fallback: "When do you want to go?")
  /// Where do you want to go?
  internal static let dstWhereDoYouWantToGo = S.tr("Localizable", "dstWhereDoYouWantToGo", fallback: "Where do you want to go?")
  /// Yes
  internal static let dstYes = S.tr("Localizable", "dstYes", fallback: "Yes")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension S {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

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
