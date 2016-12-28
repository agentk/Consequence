import Cocoa
import Influence

extension NSColor {
    static var darkRed: NSColor {
        return NSColor(red: 0.5, green: 0, blue: 0, alpha: 1)
    }

    static var lightRed: NSColor {
        return NSColor(red: 0.75, green: 0.3, blue: 0.3, alpha: 1)
    }
}

private func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}


class BoardView: NSView {

    override var isFlipped: Bool { return true }

    var board: Board! = nil {
        didSet {
            moves = []
            pegCountX = board.pegs.reduce(1) { max($0, $1.position.x) } + 1
            pegCountY = board.pegs.reduce(1) { max($0, $1.position.y) } + 1
            boardLines = board.lines
                .map { (a, b) in (board.peg(a).position, board.peg(b).position)}
            setNeedsDisplay(bounds)
        }
    }

    var moves: [String] = [] {
        didSet {
            setNeedsDisplay(bounds)
        }
    }

    var pegCountX: CGFloat = 0
    var pegCountY: CGFloat = 0
    var boardLines: [(CGPoint, CGPoint)] = []

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor.white.setFill()
        NSRectFill(bounds)

        guard let context = NSGraphicsContext.current()?.cgContext else { return }
        drawBoard(context: context)
    }

    func drawBoard(context: CGContext) {

        let scaleX = bounds.size.width / pegCountX
        let scaleY = bounds.size.height / pegCountY
        let scale = CGPoint(x: scaleX, y: scaleY)

        let scaledLines = boardLines.map { (a: CGPoint, b: CGPoint) -> (CGPoint, CGPoint) in (a * scale, b * scale) }

        context.setLineWidth(2)
        context.setStrokeColor(NSColor.lightGray.cgColor)
        for (lineStart, lineEnd) in scaledLines {
            let path = CGMutablePath()
            path.move(to: lineStart)
            path.addLine(to: lineEnd)
            context.addPath(path)
        }
        context.drawPath(using: .stroke)


        func draw(pegs: [Peg], radius: CGFloat, color: NSColor) {
            for peg in pegs {
                context.setFillColor(color.cgColor)
                context.addArc(
                    center: peg.position * scale,
                    radius: radius,
                    startAngle: 0,
                    endAngle: 2 * .pi,
                    clockwise: true)
                context.fillPath()
            }
        }

        func draw(outlinedPegs pegs: [Peg], radius: CGFloat, color: NSColor) {
            draw(pegs: pegs, radius: radius + 3, color: NSColor.white)
            draw(pegs: pegs, radius: radius, color: color)
        }

        draw(outlinedPegs: board.pegs.filter { !$0.state }, radius: 10, color: NSColor.lightGray)
        draw(outlinedPegs: board.pegs.filter { $0.state }, radius: 12, color: NSColor.lightRed)

        let movePegs = moves.map({ board.peg($0) })
        draw(outlinedPegs: movePegs, radius: 15, color: NSColor.darkRed)

        let moveAttrs = [
            NSFontAttributeName: NSFont.systemFont(ofSize: 16, weight: NSFontWeightRegular),
            NSForegroundColorAttributeName: NSColor.white]

        for (index, peg) in moves.map({ board.peg($0) }).enumerated() {

            let pegCenter = CGPoint(
                x: CGFloat(peg.position.x) * scaleX,
                y: CGFloat(peg.position.y) * scaleY)

            let pegStr = String(describing: index)

            let strSize = (pegStr as NSString).size(withAttributes: moveAttrs)

            pegStr.draw(
                with: CGRect(
                    x: pegCenter.x - strSize.width / 2,
                    y: pegCenter.y - strSize.height / 2,
                    width: strSize.width,
                    height: strSize.height),
                options: .usesLineFragmentOrigin,
                attributes: moveAttrs,
                context: nil)
        }


    }
}




