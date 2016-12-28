import Cocoa
import Influence

class ProcessViewController: ViewController {

    @IBOutlet var boardSelector: NSPopUpButton!
    @IBOutlet var maxIterationTextField: NSTextField!
    @IBOutlet var previewImageView: BoardView!
    @IBOutlet var descriptionLabel: NSTextField!

    @IBOutlet var startButton: NSButton!
    @IBOutlet var stopButton: NSButton!
    @IBOutlet var progressIndicator: NSProgressIndicator!
    @IBOutlet var progressBar: NSProgressIndicator!

    var comboCount = 0
    var operationComboCount = 0
    var operationTotalCount = 0
    var solution: [String]? = nil

    lazy var operationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Brute force search queue"
        queue.maxConcurrentOperationCount = 4
        return queue
    }()

    var selectedBoard: Board? = nil {
        didSet {
            guard let board = selectedBoard else {
                descriptionLabel.stringValue = "\nNo board selected\n\n"
                return
            }
            previewImageView.board = board
            descriptionLabel.stringValue = "\n\(board.name)\n\nReady to brute force search"
        }
    }
    var boardName: String { return selectedBoard?.name ?? "" }

    var boards: [Board] = [
        Board.test,
        Board.mountain,
        Board.trophy,
        Board.alien,
        Board.whale,
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        boardSelector.removeAllItems()

        for board in boards {
            boardSelector.addItem(withTitle: board.name)
        }

        if boards.count > 0 {
            selectedBoard = boards[0]
            boardSelector.selectItem(at: 0)
        }
    }

    @IBAction
    func boardValueChanged(_ sender: NSPopUpButton) {

        selectedBoard = boards[sender.indexOfSelectedItem]
    }

    @IBAction func didTapStart(_ sender: NSButton) {
        let depth = maxIterationTextField.integerValue
        guard let board = selectedBoard else { return }

        solution = nil
        comboCount = pow(board.pegs.count, depth)
        operationComboCount = pow(board.pegs.count, depth - 1)
        operationTotalCount = board.pegs.count

        for (startIndex, _) in board.pegs.enumerated() {
            let searchOperation = BruteSearchOperation(board: board, depth: depth, startIndex: startIndex)
            searchOperation.queuePriority = .low
            searchOperation.completionBlock = {
                DispatchQueue.main.async { self.operationDidFinish(solution: searchOperation.solution) }
            }
            operationQueue.addOperation(searchOperation)
        }

        startButton.isEnabled = false
        stopButton.isEnabled = true
        progressIndicator.startAnimation(nil)
        progressBar.doubleValue = 0
        progressBar.maxValue = Double(comboCount)
        descriptionLabel.stringValue = "\n\(board.name)\n\nSearch in progress ... 0%"

        perform(#selector(updateProgress), with: nil, afterDelay: 1)
    }

    @IBAction func didTapStop(_ sender: NSButton) {
        if operationQueue.operationCount > 0 {
            operationQueue.cancelAllOperations()
        }

        startButton.isEnabled = true
        stopButton.isEnabled = false
        progressIndicator.stopAnimation(nil)
        guard let board = selectedBoard else { return }
        descriptionLabel.stringValue = "\n\(board.name)\n\nSearch stopped"
    }

    func updateProgress() {
        guard operationQueue.operationCount > 0 else { return }

        var progress = (operationTotalCount - operationQueue.operations.count) * operationComboCount

        for rawOperation in operationQueue.operations {
            if let operation = rawOperation as? BruteSearchOperation {
                progress += operation.progress
            }
        }

        progressBar.doubleValue = Double(progress)

        if let board = selectedBoard {
            descriptionLabel.stringValue = "\n\(board.name)\n\nSearch in progress ... "
                + " \(100.0 / Float(comboCount) * Float(progress)) %"
        }

        perform(#selector(updateProgress), with: nil, afterDelay: 1)
    }

    func operationDidFinish(solution: [String]?) {

        guard (self.solution == nil && operationQueue.operations.count == 0) || solution != nil else { return }

        startButton.isEnabled = true
        stopButton.isEnabled = false
        progressIndicator.stopAnimation(nil)
        progressBar.doubleValue = 0
        progressBar.stopAnimation(nil)
        operationQueue.cancelAllOperations()

        guard let solution = solution else {
            descriptionLabel.stringValue = "\n\(boardName)\n\nSolution not found, try increasing search depth"
            return
        }
        self.solution = solution
        previewImageView.moves = solution
        descriptionLabel.stringValue = "\n\(boardName)\n\nFound solution: \(solution.joined(separator: ", "))"
    }
}
