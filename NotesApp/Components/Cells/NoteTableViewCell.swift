//
//  NoteTableViewCell.swift
//  NotesApp
//
//  Created by Telman Yusifov on 16.05.25.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let identifier: String = "NoteTableViewCell"

    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fillProportionally
        return view
    }()
    
    private var noteTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var noteDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setupUI() {
        addSubview(stackView)
        [noteTextLabel, noteDateLabel].forEach(stackView.addArrangedSubview)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    func configure(text: String, date: Date) {
        noteTextLabel.text = text
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMM dd hh:mm"
        noteDateLabel.text = formatter.string(from: date)
    }
}
