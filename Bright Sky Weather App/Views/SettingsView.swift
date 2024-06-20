//
//  SettingsView.swift
//  Bright Sky Weather App
//
//  Created by Ritesh Khore on 20/06/24.
//

import UIKit

protocol SettingViewDelegate: AnyObject {
    func settingView(_ settingView: SettingsView, didTap option: SettingOption)
}

class SettingsView: UIView {
    
    weak var delegate: SettingViewDelegate?
    
    private var settingViewModel: SettingsViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView:UITableView = {
       let table = UITableView()
       table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.delegate = self
        table.dataSource = self
        
       return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        tableView.pinSafeArea(parentView: self)
    }
    
    public func configure(with viewModel:SettingsViewModel) {
        self.settingViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let viewModel = settingViewModel {
            cell.textLabel?.text = viewModel.options[indexPath.row].title.capitalized
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewModel = settingViewModel else {
            return
        }
        
        let option = viewModel.options[indexPath.row]
        delegate?.settingView(self, didTap: option)
    }
}
