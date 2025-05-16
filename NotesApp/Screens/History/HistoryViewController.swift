//
//  HistoryViewController.swift
//  NotesApp
//
//  Created by Telman Yusifov on 16.05.25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History"
        
        view.backgroundColor = .systemBackground
        
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        setupUI()
        
        notes = UserDefaultsManager.shared.getNotes()
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell else { return UITableViewCell() }
        cell.configure(text: notes[indexPath.row].text, date: notes[indexPath.row].createdDate)
        return cell
    }
}
