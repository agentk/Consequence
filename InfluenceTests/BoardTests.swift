import XCTest
import Influence

class BoardTests: XCTestCase {

    let testBoard = Board(
        name: "TestBoard",
        pegs: [
            Peg("a1", state: false, position: (1, 1)),
            Peg("a2", state: false, position: (2, 1)),
            Peg("a3", state: false, position: (3, 1)),
            Peg("a4", state: false, position: (4, 1)),
            Peg("b1", state: false, position: (1, 2)),
            Peg("b2", state: false, position: (2, 2)),
            Peg("b3", state: false, position: (3, 2)),
            Peg("b4", state: false, position: (4, 2)),
            Peg("c1", state: false, position: (1, 3)),
            Peg("c2", state: false, position: (2, 3)),
            Peg("c3", state: false, position: (3, 3)),
            Peg("c4", state: false, position: (4, 3)),
            Peg("d1", state: false, position: (1, 4)),
            Peg("d2", state: false, position: (2, 4)),
            Peg("d3", state: false, position: (3, 4)),
            Peg("d4", state: false, position: (4, 4)),
            ],
        lines: [
            ("a1", "a2"), ("a2", "a3"), ("a3", "a4"),
            ("b1", "b2"), ("b2", "b3"), ("b3", "b4"),
            ("c1", "c2"), ("c2", "c3"), ("c3", "c4"),
            ("d1", "d2"), ("d2", "d3"), ("d3", "d4"),
            ("a1", "b1"), ("b1", "c1"), ("c1", "d1"),
            ("a2", "b2"), ("b2", "c2"), ("c2", "d2"),
            ("a3", "b3"), ("b3", "c3"), ("c3", "d3"),
            ("a4", "b4"), ("b4", "c4"), ("c4", "d4"),
            ])

    let testSolution = ["d3", "c1", "b4", "a2"]

    func testInit() {
        XCTAssertEqual(testBoard.name, "TestBoard")
        XCTAssertEqual(testBoard.pegs.count, 4 * 4)
        XCTAssertEqual(testBoard.pegs.count, testBoard.ids.count)
        XCTAssertEqual(testBoard.lines.count, 4 * 6)
        XCTAssertEqual(testBoard.complete, false)
    }

    func render(board: Board) -> String {
        return board.pegs.reduce("") { iter, peg in
            iter + (peg.state ? "O" : "-")
        }
    }

    func testToggle() {
        let board = testBoard.toggle(index: "a2")
        XCTAssertEqual(render(board: board), ""
            + "OOO-"
            + "-O--"
            + "----"
            + "----")
    }

    func testPeg() {
        let pegB3 = testBoard.peg("b3")
        XCTAssertEqual(pegB3.id, "b3")
        XCTAssertEqual(pegB3.state, false)
        XCTAssertEqual(pegB3.position.x, 3)
        XCTAssertEqual(pegB3.position.y, 2)
    }

    func testPerformMoves() {
        let board = testBoard.perform(moves: ["a1", "b2", "c3", "d4"])
        XCTAssertEqual(render(board: board), ""
            + "O---"
            + "-O--"
            + "--O-"
            + "---O")
    }

    func testComplete() {
        let board = testBoard.perform(moves: testSolution)
        XCTAssertEqual(render(board: board), ""
            + "OOOO"
            + "OOOO"
            + "OOOO"
            + "OOOO")
        XCTAssertEqual(board.complete, true)
    }
}







