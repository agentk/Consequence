import Cocoa

@IBDesignable
class BackgroundView: NSView {

    override var isOpaque: Bool { return true }

    @IBInspectable
    var backgroundColor: NSColor = NSColor.darkGray {
        didSet { setNeedsDisplay(bounds) }
    }

    override func draw(_ rect: NSRect) {
        super.draw(rect)
        backgroundColor.setFill()
        NSRectFill(bounds)
    }
}
