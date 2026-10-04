// FILE: CodexMobileAppDelegate.swift
// Purpose: AppDelegate stub -- APNs registration personal team'de desteklenmedigi icin devre disi.
// Layer: App
// Exports: CodexMobileAppDelegate, Notification.Name push-registration helpers
// Depends on: Foundation, UIKit

import Foundation
import UIKit

extension Notification.Name {
    static let codexDidRegisterForRemoteNotifications = Notification.Name("codex.didRegisterForRemoteNotifications")
    static let codexDidFailToRegisterForRemoteNotifications = Notification.Name("codex.didFailToRegisterForRemoteNotifications")
}

final class CodexMobileAppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        NotificationCenter.default.post(
            name: .codexDidRegisterForRemoteNotifications,
            object: nil,
            userInfo: ["deviceToken": deviceToken]
        )
    }

    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        NotificationCenter.default.post(
            name: .codexDidFailToRegisterForRemoteNotifications,
            object: nil,
            userInfo: ["error": error]
        )
    }
}
