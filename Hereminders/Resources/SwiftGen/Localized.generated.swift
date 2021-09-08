// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Home {
    /// Settings
    internal static let settings = L10n.tr("Localizable", "Home.Settings")
    /// Hereminders
    internal static let title = L10n.tr("Localizable", "Home.Title")
  }

  internal enum Notification {
    /// Done
    internal static let done = L10n.tr("Localizable", "Notification.Done")
    /// Hereminder for you!
    internal static let hereminderForYou = L10n.tr("Localizable", "Notification.HereminderForYou")
  }

  internal enum Placedetails {
    /// Address
    internal static let address = L10n.tr("Localizable", "PlaceDetails.Address")
    /// Name
    internal static let name = L10n.tr("Localizable", "PlaceDetails.Name")
    /// Type the place name
    internal static let namePlaceholder = L10n.tr("Localizable", "PlaceDetails.NamePlaceholder")
    /// Place Details
    internal static let title = L10n.tr("Localizable", "PlaceDetails.Title")
  }

  internal enum Placelist {
    /// Place List
    internal static let title = L10n.tr("Localizable", "PlaceList.Title")
  }

  internal enum Placesearch {
    /// Type an address or place name
    internal static let namePlaceholder = L10n.tr("Localizable", "PlaceSearch.NamePlaceholder")
    /// Place Search
    internal static let title = L10n.tr("Localizable", "PlaceSearch.Title")
  }

  internal enum Reminder {
    /// Add new Hereminder
    internal static let addNewReminder = L10n.tr("Localizable", "Reminder.AddNewReminder")
    /// Description
    internal static let description = L10n.tr("Localizable", "Reminder.Description")
    /// Type the Hereminder description
    internal static let descriptionPlaceholder = L10n.tr("Localizable", "Reminder.DescriptionPlaceholder")
    /// No description
    internal static let noDescription = L10n.tr("Localizable", "Reminder.NoDescription")
    /// On entry
    internal static let onEntry = L10n.tr("Localizable", "Reminder.OnEntry")
    /// On exit
    internal static let onExit = L10n.tr("Localizable", "Reminder.OnExit")
    /// New Hereminder
    internal static let title = L10n.tr("Localizable", "Reminder.Title")
    /// When
    internal static let when = L10n.tr("Localizable", "Reminder.When")
  }

  internal enum Reminderlist {
    /// Add new place
    internal static let addNewPlace = L10n.tr("Localizable", "ReminderList.AddNewPlace")
    /// Add Hereminder
    internal static let addReminder = L10n.tr("Localizable", "ReminderList.AddReminder")
    /// Done
    internal static let done = L10n.tr("Localizable", "ReminderList.Done")
    /// No Hereminders here!
    internal static let noHereminders = L10n.tr("Localizable", "ReminderList.NoHereminders")
    /// On entry
    internal static let onEntry = L10n.tr("Localizable", "ReminderList.OnEntry")
    /// On exit
    internal static let onExit = L10n.tr("Localizable", "ReminderList.OnExit")
    /// Select or add a new place
    internal static let selectOrAddPlace = L10n.tr("Localizable", "ReminderList.SelectOrAddPlace")
    /// Welcome to Hereminders!
    internal static let welcome = L10n.tr("Localizable", "ReminderList.Welcome")
  }

  internal enum Settings {
    /// About
    internal static let about = L10n.tr("Localizable", "Settings.About")
    /// Become Premium 🤩
    internal static let becomePremium = L10n.tr("Localizable", "Settings.BecomePremium")
    /// Contributors
    internal static let contributors = L10n.tr("Localizable", "Settings.Contributors")
    /// Credits
    internal static let credits = L10n.tr("Localizable", "Settings.Credits")
    /// Icons made by Smashicons (www.flaticon.com)
    internal static let logoCredit = L10n.tr("Localizable", "Settings.LogoCredit")
    /// Manage places
    internal static let managePlaces = L10n.tr("Localizable", "Settings.ManagePlaces")
    /// Places
    internal static let places = L10n.tr("Localizable", "Settings.Places")
    /// Premium
    internal static let premium = L10n.tr("Localizable", "Settings.Premium")
    /// Settings
    internal static let title = L10n.tr("Localizable", "Settings.Title")
    /// Version %@ (%@)
    internal static func version(_ p1: String, _ p2: String) -> String {
      return L10n.tr("Localizable", "Settings.Version", p1, p2)
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
