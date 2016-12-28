import Cocoa
import Influence

class BruteSearchOperation: Operation {

    let depth: Int
    let startIndex: Int
    let pegs: [Peg]
    let board: [Bool]
    let pegCount: Int
    let comboCount: Int
    var reactions = [Int: [Int]]()
    var pegMoves = [Int]()

    var progress = 0
    var solution: [String]? = nil

    init(board sourceBoard: Board, depth: Int, startIndex: Int) {

        // Precalculate values that don't need to be done on the operation thread
        // TODO: Specifically, most of these values should be calculated once and shared between operations

        self.depth = depth
        self.startIndex = startIndex
        pegMoves = [Int](repeating: -1, count: depth)

        pegs = sourceBoard.pegs
        board = pegs.map { $0.state }
        pegCount = pegs.count
        comboCount = Int(pow(Double(pegCount), Double(depth - 1)))

        var pegIndexMap = [String: Int]()
        for (index, peg) in pegs.enumerated() {
            pegIndexMap[peg.id] = index
        }

        for i in 0..<pegs.count {
            reactions[i] = [i]
        }

        let indexedLines: [(Int, Int)] = sourceBoard.lines.map { (pegIndexMap[$0.0]!, pegIndexMap[$0.1]!) }

        for (a, b) in indexedLines {
            reactions[a]?.append(b)
            reactions[b]?.append(a)
        }
        

    }

    override func main() {

        var index = 0
        while index < comboCount && !isCancelled {

            progress = index

            var newBoard = board
            for i in pegMoves {
                if i != -1 {
                    for toggleIndex in reactions[i]! {
                        newBoard[toggleIndex] = !newBoard[toggleIndex]
                    }
                }
            }

            if boardComplete(board: newBoard) {
                // Found a solution, convert it back to move strings
                var solution = [String]()
                for i in pegMoves where i != -1 {
                    solution.append(pegs[i].id)
                }
                self.solution = solution
                return
            }

            pegMoves[1] += 1

            // Run the peggle incrementer
            for peggleIndex in 1..<depth {
                if pegMoves[peggleIndex] >= pegCount {
                    pegMoves[peggleIndex] = 0
                    if peggleIndex + 1 < pegMoves.count {
                        pegMoves[peggleIndex + 1] += 1
                    }
                }
            }
            
            index += 1
        }
    }

    fileprivate func boardComplete(board: [Bool]) -> Bool {
        for item in board {
            if item == false {
                return false
            }
        }
        return true
    }
}
