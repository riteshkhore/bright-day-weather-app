//
//  SettingsVC.swift
//  Bright Sky Weather App
//
//  Created by Ritesh Khore on 20/06/24.
//

import UIKit

class SettingsVC: UIViewController {
    
    private lazy var primaryView:SettingsView = {
       let view = SettingsView()
        view.configure(with: SettingsViewModel(options: SettingOption.allCases))
       return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        primaryView.delegate = self
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        primaryView.pinSafeArea(parentView: view)
    }
}

extension SettingsVC: SettingViewDelegate {
    func settingView(_ settingView: SettingsView, didTap option: SettingOption) {
        print("Table option tapped....")
        switch option {
        case .upgrade:
            break
        case .privacyPolicy:
            break
        case .terms:
            break
        case .contact:
            break
        case .getHelp:
            break
        case .rateApp:
            break
        }
    }
}
