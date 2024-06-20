//
//  SettingVIewModel.swift
//  Bright Sky Weather App
//
//  Created by Ritesh Khore on 20/06/24.
//

import Foundation

struct SettingsViewModel {
    let options: [SettingOption]
}

enum SettingOption: CaseIterable {
    case upgrade
    case privacyPolicy
    case terms
    case contact
    case getHelp
    case rateApp
    
    var title: String {
        switch self {
        case .upgrade:
            return "upgrade"
        case .privacyPolicy:
            return "privacy policy"
        case .terms:
            return "terms of use"
        case .contact:
            return "contact use"
        case .getHelp:
            return "get help"
        case .rateApp:
            return "rate us"
        }
    }
}
