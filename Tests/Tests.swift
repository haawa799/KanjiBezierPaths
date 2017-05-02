
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
        XCTAssert(pathes?.count == 8)
    }
    
    func test2() {
        let pathes = helper.pathesForKanji("数")
        XCTAssert(pathes?.count == 13)
    }
    
    func test3() {
        let pathes = helper.pathesForKanji("働")
        XCTAssert(pathes?.count == 13)
    }
    
    func test4() {
        let pathes = helper.pathesForKanji("苦")
        XCTAssert(pathes?.count == 8)
    }
    
    func test5() {
        let pathes = helper.pathesForKanji("指")
        XCTAssert(pathes?.count == 9)
    }
    
    func test6() {
        let pathes = helper.pathesForKanji("郎")
        XCTAssert(pathes?.count == 9)
    }
    
    func test7() {
        let pathes = helper.pathesForKanji("病")
        XCTAssert(pathes?.count == 10)
    }
    
    func test8() {
        let pathes = helper.pathesForKanji("院")
        XCTAssert(pathes?.count == 10)
    }
    
    func testAllKanji() {
        self.measure {
            let allKanji = self.helper.allKanjiArray()
            for kani in allKanji {
                XCTAssert(kani.count > 0)
            }
        }
    }
    
    func testRealmDB() {
        XCTAssertNotNil(helper.realm)
    }
    
    func testDoesntExist() {
        let pathes = helper.pathesForKanji("A")
        XCTAssertNil(pathes)
    }
    
    func testRealmKanji() {
        let kanji = Kanji()
        kanji.id = "病"
        kanji.data = Data()
        
        XCTAssertEqual(kanji.id, "病")
        XCTAssertEqual(kanji.data.count, 0)
        XCTAssertEqual(Kanji.primaryKey(), "id")
    }
    
}
