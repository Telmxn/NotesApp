//
//  UserDefaultsManager.swift
//  NotesApp
//
//  Created by Telman Yusifov on 16.05.25.
//

import Foundation

enum UserDefaultKeys: String {
    case notes
}

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userDefaults: UserDefaults
    
    init() {
        self.userDefaults = UserDefaults.standard
    }
    
    func saveNotes(notes: [Note]) {
        if let encodedData = try? JSONEncoder().encode(notes) {
            userDefaults.setValue(encodedData, forKey: UserDefaultKeys.notes.rawValue)
            userDefaults.synchronize()
        }
    }
    
    func getNotes() -> [Note] {
        if let notesData = userDefaults.object(forKey: UserDefaultKeys.notes.rawValue) as? Data {
            if let decodedData = try? JSONDecoder().decode([Note].self, from: notesData) {
                return decodedData
            }
        }
        return []
    }
    
    func remove(key: UserDefaultKeys) {
        userDefaults.removeObject(forKey: key.rawValue)
        userDefaults.synchronize()
    }
}
