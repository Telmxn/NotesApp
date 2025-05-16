//
//  HomeViewController.swift
//  NotesApp
//
//  Created by Telman Yusifov on 16.05.25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fillEqually
        return view
    }()
    
    private var noteTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter your note..."
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    private var addNoteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Note", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        let barButton = UIBarButtonItem(image: UIImage(systemName: "clock"), style: .done, target: self, action: #selector(didTapHistoryButton))
        navigationItem.setRightBarButton(barButton, animated: true)
        
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    @objc
    private func didTapHistoryButton() {
        navigationController?.pushViewController(HistoryViewController(), animated: true)
    }

    private func setupUI() {
        view.addSubview(stackView)
        
        [noteTextField, addNoteButton].forEach(stackView.addArrangedSubview)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        addNoteButton.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }

}

