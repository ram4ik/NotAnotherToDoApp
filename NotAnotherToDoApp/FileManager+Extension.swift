//
//  FileManager+Extension.swift
//  NotAnotherToDoApp
//
//  Created by Ramill Ibragimov on 25.04.2021.
//

import Foundation

let fileName = "ToDos.json"

extension FileManager {
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveDocument(contens: String, docName: String, completion: (Error?) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contens.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }
    }
    
    func readDocument(docName: String, completion: (Result<Data, Error>) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    func docExists(name docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
