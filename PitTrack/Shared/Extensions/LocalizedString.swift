//
//  LocalizedString.swift
//  PitTrack
//
//  Created by Ilia Kurlovich on 02.08.25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(
            self,
            comment: "\(self) could not be found in Localizable.strings"
        )
    }
}

