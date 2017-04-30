
@testable import KanjiBezierPaths
import XCTest

class Tests: XCTestCase {
  
  var helper: KanjiProvider!
  
  override func setUp() {
    super.setUp()
    helper = KanjiProvider()
  }
  
  func test1() {
    let pathes = helper.pathesForKanji("京")
    assert(pathes?.count == 8)
  }
  
  func test2() {
    let pathes = helper.pathesForKanji("数")
    assert(pathes?.count == 13)
  }
  
  func test3() {
    let pathes = helper.pathesForKanji("働")
    assert(pathes?.count == 13)
  }
  
  func test4() {
    let pathes = helper.pathesForKanji("苦")
    assert(pathes?.count == 8)
  }
  
  func test5() {
    let pathes = helper.pathesForKanji("指")
    assert(pathes?.count == 9)
  }
  
  func test6() {
    let pathes = helper.pathesForKanji("郎")
    assert(pathes?.count == 9)
  }
  
  func test7() {
    let pathes = helper.pathesForKanji("病")
    assert(pathes?.count == 10)
  }
  
  func test8() {
    let pathes = helper.pathesForKanji("院")
    assert(pathes?.count == 10)
  }
  
  func test9() {
    self.measure {
      let allKanji = self.helper.allKanjiArray()
      for kani in allKanji {
        XCTAssert(kani.count > 0)
      }
    }
  }
  
}
