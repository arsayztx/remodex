// FILE: SubscriptionService.swift
// Purpose: Self-host stub -- tüm ozellikleri acik tutar, RevenueCat gerektirmez.
// Layer: Service
// Exports: SubscriptionService, SubscriptionPackageOption
// Depends on: Foundation, Observation

import Foundation
import Observation

enum SubscriptionBootstrapState: Equatable {
    case idle
    case loading
    case ready
    case failed
}

struct SubscriptionPackageOption: Identifiable {
    let id: String
    var isLifetime: Bool { true }
    var title: String { "Self-Hosted" }
    var price: String { "" }
    var periodLabel: String { "" }
    var termsDescription: String { "" }
    var callToActionTitle: String { "" }
    var footerDescription: String { "" }
}

@MainActor
@Observable
final class SubscriptionService {
    private(set) var bootstrapState: SubscriptionBootstrapState = .ready
    private(set) var hasProAccess = true
    private(set) var freeSendCount = 0
    private(set) var remainingFreeSendAttempts: Int = .max
    private(set) var hasFreeSendAccess: Bool = true
    private(set) var hasAppAccess: Bool = true
    private(set) var packageOptions: [SubscriptionPackageOption] = []
    private(set) var isLoading = false
    private(set) var isPurchasing = false
    private(set) var isRestoring = false
    private(set) var lastErrorMessage: String?
    private(set) var latestPurchaseDate: Date?
    private(set) var willRenew = false
    private(set) var managementURL: URL?
    private(set) var customerInfo: Any?
    private(set) var currentOffering: Any?

    init(defaults: UserDefaults = .standard) {}

    func bootstrap() async {
        bootstrapState = .ready
    }

    func consumeFreeSendAttemptIfNeeded() {}

    func refreshCustomerInfoSilently() async {}

    func loadOfferings() async {}

    func purchase(_ option: SubscriptionPackageOption) async {}

    func restorePurchases() async {}
}
