import XCTest
import Influence

class PegTests: XCTestCase {

    let peg = Peg("id", state: false, position: (99, 100))

    func testInit() {
        XCTAssertEqual(peg.id, "id")
        XCTAssertEqual(peg.state, false)
        XCTAssertEqual(peg.position.x, 99)
        XCTAssertEqual(peg.position.y, 100)
    }

    func testToggle() {
        let peg2 = peg.toggled
        let peg3 = peg2.toggled

        XCTAssertEqual(peg3.id, "id")
        XCTAssertEqual(peg3.position.x, 99)
        XCTAssertEqual(peg3.position.y, 100)

        XCTAssertEqual(peg2.state, true)
        XCTAssertEqual(peg3.state, false)
        XCTAssertNotEqual(peg.state, peg2.state)
        XCTAssertEqual(peg.state, peg3.state)
    }

    func testPerformanceExample() {
        var peg = self.peg
        self.measure {
            for _ in 0..<10_000_000 {
                peg = peg.toggled
            }
            XCTAssertEqual(peg.state, false)
        }
    }
}
