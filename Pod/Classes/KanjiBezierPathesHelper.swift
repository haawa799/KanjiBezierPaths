//
//  KanjiBezierPathesHelper.swift
//  Pods
//
//  Created by Andriy K. on 12/25/15.
//
//

import UIKit

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
  
  public static func pathesForKanji(kanji: String) -> [UIBezierPath]? {
    
    guard let bundle = podBundle else { return nil }
    
    guard let path = bundle.pathForResource(kanji, ofType: nil) else {
      return nil
    }
    
    if let result = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [UIBezierPath] {
      return result
    }
    
    return nil
  }
  
}
