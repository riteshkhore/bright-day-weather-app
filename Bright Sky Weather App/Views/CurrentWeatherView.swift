//
//  CurrentWeatherView.swift
//  Bright Sky Weather App
//
//  Created by Ritesh Khore on 20/06/24.
//

import UIKit

class CurrentWeatherView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
