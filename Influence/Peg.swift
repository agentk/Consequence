public struct Peg {

    public var id: String
    public var state: Bool
    public var position: CGPoint

    public init(_ id: String, state: Bool, position: (x: Int, y: Int)) {
        self.id = id
        self.state = state
        self.position = CGPoint(x: position.x, y: position.y)
    }

    public var toggled: Peg {
        var peg = self
        peg.state = !state
        return peg
    }
}
