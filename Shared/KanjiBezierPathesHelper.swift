//
//  KanjiBezierPathesHelper.swift
//  Pods
//
//  Created by Andriy K. on 12/25/15.
//
//

#if os(OSX)
  import AppKit
  public typealias BezierPath = NSBezierPath
#else
  import UIKit
  public typealias BezierPath = UIBezierPath
#endif

import SQLite

private class KanjiBundleSearch {}

public struct KanjiProvider {
  
  private struct Constants {
    static let dbFileName = "kanjDB"
    static let dbFileExtension = "db"
    static let tableName = "KANJI"
    static let encodedBezierClass = "UIBezierPath"
    
    struct Column {
      static let id = "ID"
      static let value = "VALUE"
    }
  }
  
  public init() {}
  
  public static let podBundle: NSBundle? = {
    let bundle = NSBundle(forClass: KanjiBundleSearch.self)
    return bundle
  }()
  
  public let db: Connection? = {
    guard let podBundle = podBundle else { return nil }
    if let resourcesPath = podBundle.resourcePath {
      let results = try! NSFileManager.defaultManager().contentsOfDirectoryAtPath(resourcesPath)
      print(results)
    }
    guard let path = podBundle.pathForResource(Constants.dbFileName, ofType: Constants.dbFileExtension) else { return nil }
    let db = try? Connection(path)
    return db
  }()
  
  public func pathesForKanji(kanji: String) -> [BezierPath]? {
    
    guard let db = db else { return nil }
    let kanjiTable = Table(Constants.tableName)
    let id = Expression<String>(Constants.Column.id)
    let value = Expression<NSData>(Constants.Column.value)
    
    let query = kanjiTable.select([id, value]).filter(id == kanji).limit(1)
    guard let data = try! db.prepare(query).map({ $0.get(value) }).first else { return nil }
    #if os(OSX)
      NSKeyedUnarchiver.setClass(BezierPath.self, forClassName: Constants.encodedBezierClass)
    #endif
    let result = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [BezierPath]
    return result
  }
  
}
