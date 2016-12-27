//
//  KanjiBezierPathesHelper.swift
//  Pods
//
//  Created by Andriy K. on 12/25/15.
//
//

import UIKit
import SQLite

private class KanjiBundleSearch {}

public struct KanjiBezierPathesHelper {
  
  public static let podBundle: NSBundle? = {
    
    let bundle0 = NSBundle(forClass: KanjiBundleSearch.self)
    if let bundleURL = bundle0.URLForResource("KanjiBezierPaths", withExtension: "bundle") {
      if let bundle = NSBundle(URL: bundleURL) {
        return bundle
      }
      
    }
    return nil
  }()
  
  public static let db: Connection? = {
    guard
      let podBundle = podBundle else { return nil }
    let docsPath = podBundle.resourcePath!
    let fileManager = NSFileManager.defaultManager()
    
    do {
      let docsArray = try fileManager.contentsOfDirectoryAtPath(docsPath)
      print(docsArray)
    } catch {
      print(error)
    }
    let path = podBundle.pathForResource("kanjDB", ofType: "db")!
    let db = try! Connection(path, readonly: true)
    return db
  }()
  
  public static func pathesForKanji(kanji: String) -> [UIBezierPath]? {
    
    guard let db = db else { return nil }
    
    let allKanji = Table("KANJI")
    let id = Expression<String>("ID")
    let value = Expression<NSData>("VALUE")
    
    do {
      try db.prepare(allKanji)
    } catch _ {
      return nil
    }
    
    guard let aKanji = Array(try! db.prepare("SELECT ID, VALUE FROM KANJI WHERE \"ID\" == \"\(kanji)\"")).first else { return nil }
    guard let blob = aKanji[1] as? SQLite.Blob else { return nil }
    let data = NSData(bytes: blob.bytes, length: blob.bytes.count * sizeof(UInt8))
    if let result = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [UIBezierPath] {
      return result
    }
    
    return nil
  }
  
}
