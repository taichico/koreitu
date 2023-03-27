import Foundation
import UIKit

extension FileManager {
    func writingFile(_ text:String) {
        // Documentsディレクトリまでのパスを生成
        guard let docURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("URL取得失敗")
        }
        // ファイル名を含めたフルパスを生成
        let fullURL = docURL.appendingPathComponent("sample.txt")

        do {
            // 書き込み処理
            try text.write(to: fullURL,atomically: true,encoding: .utf8)
        } catch{
            print("書き込み失敗")
        }
    }
    
    func dateAppendText(item: Item) -> String? {
        guard let dirURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("フォルダURL取得エラー")
        }
        let fileURL = dirURL.appendingPathComponent("sample.txt" + item.itemWord)
        do {
            
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            let date = Date()
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            let readStr = readingFile(item: item)
            let stringToWrite = "\n" + df.string(from: date)
            var array = readStr?.components(separatedBy: "\n")
            
            if array?.last != df.string(from: date) || array?.isEmpty == true {
                fileHandle.seekToEndOfFile()
                fileHandle.write(stringToWrite.data(using: String.Encoding.utf8)!)
                return stringToWrite
            } else {
                return nil
            }
        } catch let error as NSError {
            print("Error: \(error)")
            return nil
        }
    }
    
    
    func appendText(string: String) -> String? {
        guard let dirURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("フォルダURL取得エラー")
        }
        let fileURL = dirURL.appendingPathComponent("sample.txt")
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            let stringToWrite = "\n" + string
            fileHandle.seekToEndOfFile()
            fileHandle.write(stringToWrite.data(using: String.Encoding.utf8)!)
            return stringToWrite
        } catch let error as NSError {
            print("Error: \(error)")
            return nil
        }
    }
    
    func readingFile(item: Item) -> String? {
        guard let docURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("URL取得失敗")
        }
        let fullURL = docURL.appendingPathComponent("sample.txt" + item.itemWord)
        do {
            let textData = try String(contentsOf: fullURL, encoding: .utf8)
            return textData
        } catch {
            return nil
        }
    }
    
    func createFile(item: Item) {
        // String型のDocPathを作成
        let docPath =  NSHomeDirectory() + "/Documents"
        let filePath = docPath + "/sample.txt" + item.itemWord
        
        if !fileExists(atPath: filePath) {
            createFile(atPath:filePath, contents: nil, attributes: [:])
        }else{
            print("既に存在します。")
        }
    }
    
    func removeFile(){
        guard let docURL = urls(for: .documentDirectory, in: .userDomainMask).first else{
            fatalError("URL取得失敗")
        }
        let fullURL = docURL.appendingPathComponent("sample.txt")
        do {
            try removeItem(at: fullURL)
        } catch {
            print(error.localizedDescription)
        }
    }
}
