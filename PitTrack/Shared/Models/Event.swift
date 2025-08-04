//
//  Event.swift
//  PitTrack
//
//  Created by Ilia Kurlovich on 03.08.25.
//

import Foundation
import SwiftData

@Model
final class Event {
    var typeRaw: String
    var customName: String?
    var date: Date
    var notification: Bool
    var notificationPeriodRaw: String
    var car: Car?

    init(type: EventType, customName: String?, date: Date, notification: Bool, notificationPeriod: NotificationPeriod, car: Car?) {
        self.typeRaw = type.rawValue
        self.customName = customName
        self.date = date
        self.notification = notification
        self.notificationPeriodRaw = notificationPeriod.rawValue
        self.car = car
    }

    var type: EventType {
        get { EventType(rawValue: typeRaw) ?? .other }
        set { typeRaw = newValue.rawValue }
    }

    var notificationPeriod: NotificationPeriod {
        get { NotificationPeriod(rawValue: notificationPeriodRaw) ?? .one }
        set { notificationPeriodRaw = newValue.rawValue }
    }
}

enum EventType: String, Codable, CaseIterable {
    case visaRan, insurance, parking, service, other
}

enum NotificationPeriod: String, Codable, CaseIterable {
    case one, three, five

    var days: Int {
        switch self {
        case .one: return 1
        case .three: return 3
        case .five: return 5
        }
    }
}
