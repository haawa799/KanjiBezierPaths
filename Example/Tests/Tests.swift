// https://github.com/Quick/Quick

import Quick
import Nimble
import KanjiBezierPaths

class TableOfContentsSpec: QuickSpec {
  override func spec() {
    
    
    describe("Bundle") { () -> () in
      
      it("Pod bundle", closure: { () -> () in
        expect(KanjiBezierPathesHelper.podBundle) != nil
      })
      
    }
    
    describe("Database") { () -> () in
      
      it("DB not nil", closure: { () -> () in
        assert(KanjiBezierPathesHelper.db != nil)
      })
      
    }
    
    describe("Kanji tests") {
      
      it("京", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("京")
        expect(pathes) != nil
        expect(pathes!.count) == 8
      })
      
      it("数", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("数")
        expect(pathes) != nil
        expect(pathes!.count) == 13
      })
      
      it("働", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("働")
        expect(pathes) != nil
        expect(pathes!.count) == 13
      })
      
      it("苦", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("苦")
        expect(pathes) != nil
        expect(pathes!.count) == 8
      })
      
      it("指", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("指")
        expect(pathes) != nil
        expect(pathes!.count) == 9
      })
      
      it("郎", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("郎")
        expect(pathes) != nil
        expect(pathes!.count) == 9
      })
      
      it("病", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("病")
        expect(pathes) != nil
        expect(pathes!.count) == 10
      })
      
      it("院", closure: { () -> () in
        let pathes = KanjiBezierPathesHelper.pathesForKanji("院")
        expect(pathes) != nil
        expect(pathes!.count) == 8
      })
      
    }
  }
}
