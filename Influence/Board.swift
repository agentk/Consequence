public struct Board {

    public var name: String

    public var ids: [String]

    public var pegs: [Peg]

    public var lines: [(String, String)]

    public var complete: Bool {
        return !pegs.contains { $0.state == false }
    }

    public init(name: String, pegs: [Peg], lines: [(String, String)]) {

        self.name = name
        self.ids = pegs.map { $0.id }
        self.pegs = pegs
        self.lines = lines
    }

    public func toggle(index i: String) -> Board {

        let toToggle = [i] + lines.flatMap {
            switch ($0.0, $0.1) {
            case (i, let val), (let val, i): return val
            default: return nil
            }}

        var board = self
        board.pegs = pegs.map { peg -> Peg in
            if toToggle.contains(peg.id) {
                return peg.toggled
            }
            return peg
        }

        return board
    }

    public func peg(_ id: String) -> Peg {
        return pegs.first { $0.id == id }!
    }

    public func perform(moves: [String]) -> Board {
        return moves.reduce(self) { (prev, move) -> Board in
            prev.toggle(index: move)
        }
    }
}
