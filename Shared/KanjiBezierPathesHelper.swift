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

import RealmSwift
import Realm

class Kanji: Object {
  dynamic var id = ""
  dynamic var data = Data()
  override class func primaryKey() -> String? {
    return "id"
  }
}

public class KanjiProvider {
  
  private struct Constants {
    static let encodedBezierClass = "UIBezierPath"
    static let kanjiRealmFilename = "kanji"
    static let realmExtension = "realm"
    static let scheme: UInt64 = 6
    
  }
  
  public init() {}
  
  public static let bundle: Bundle = {
    return Bundle(for: KanjiProvider.self)
  }()
  
  let realm: Realm = {
    Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: Constants.scheme, migrationBlock: nil)
    let bundleUrl = KanjiProvider.bundle.url(forResource: Constants.kanjiRealmFilename, withExtension: Constants.realmExtension)!
    return try! Realm(fileURL: bundleUrl)
  }()
  
  public func pathesForKanji(_ kanji: String) -> [BezierPath]? {
    guard let kanjiObj = realm.object(ofType: Kanji.self, forPrimaryKey: kanji) else { return nil }
    let data = kanjiObj.data
    #if os(OSX)
      NSKeyedUnarchiver.setClass(BezierPath.self, forClassName: Constants.encodedBezierClass)
    #endif
    let result = NSKeyedUnarchiver.unarchiveObject(with: data)
    return result as? [BezierPath]
  }
  
  func allKanjiArray() -> [[BezierPath]] {
    return realm.objects(Kanji.self).flatMap { pathesForKanji($0.id) }
  }
  
}
