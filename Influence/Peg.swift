public struct Peg {

    public var id: String

    public var state: Bool

    public var position: Point

    public var toggled: Peg {
        var peg = self
        peg.state = !state
        return peg
    }

    public init(_ id: String, state: Bool, position: (x: Int, y: Int)) {
        self.id = id
        self.state = state
        self.position = Point(x: position.x, y: position.y)
    }

    private init(id: String, state: Bool, point: Point) {
        self.id = id
        self.state = state
        self.position = point
    }
}
