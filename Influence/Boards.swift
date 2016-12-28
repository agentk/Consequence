public extension Board {

    static var test: Board { return Board(
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
            ])}

    
    static var mountain: Board { return Board(
        name: "Mountain",
        pegs: [
            Peg("a1", state: false, position: (5, 1)),
            Peg("b1", state: false, position: (4, 2)),
            Peg("b2", state: false, position: (6, 2)),
            Peg("c1", state: false, position: (3, 3)),
            Peg("c2", state: false, position: (5, 3)),
            Peg("c3", state: false, position: (7, 3)),
            Peg("d1", state: false, position: (2, 4)),
            Peg("d2", state: false, position: (4, 4)),
            Peg("d3", state: false, position: (6, 4)),
            Peg("d4", state: false, position: (8, 4)),
            Peg("e1", state: false, position: (1, 5)),
            Peg("e2", state: false, position: (3, 5)),
            Peg("e3", state: false, position: (5, 5)),
            Peg("e4", state: false, position: (7, 5)),
            Peg("e5", state: false, position: (9, 5)),
            ],
        lines: [
            ("a1", "b1"), ("a1", "b2"),
            ("b1", "b2"),

            ("b1", "c1"), ("b1", "c2"),
            ("b2", "c2"), ("b2", "c3"),
            ("c1", "c2"), ("c2", "c3"),

            ("c1", "d1"), ("c1", "d2"),
            ("c2", "d2"), ("c2", "d3"),
            ("c3", "d3"), ("c3", "d4"),
            ("d1", "d2"), ("d2", "d3"), ("d3", "d4"),

            ("d1", "e1"), ("d1", "e2"),
            ("d2", "e2"), ("d2", "e3"),
            ("d3", "e3"), ("d3", "e4"),
            ("d4", "e4"), ("d4", "e5"),
            ("e1", "e2"), ("e2", "e3"), ("e3", "e4"), ("e4", "e5"),
            ])}


    static var trophy: Board { return Board(
        name: "Trophy",
        pegs: [
            Peg("a1", state: false, position: (1, 1)),
            Peg("a2", state: false, position: (2, 1)),
            Peg("a3", state: false, position: (3, 1)),
            Peg("a4", state: false, position: (4, 1)),
            Peg("a5", state: true, position: (5, 1)),

            Peg("b1", state: false, position: (1, 2)),
            Peg("b2", state: false, position: (2, 2)),
            Peg("b3", state: false, position: (3, 2)),
            Peg("b4", state: false, position: (4, 2)),
            Peg("b5", state: true, position: (5, 2)),

            Peg("c2", state: false, position: (2, 3)),
            Peg("c3", state: false, position: (3, 3)),
            Peg("c4", state: true, position: (4, 3)),

            Peg("d3", state: false, position: (3, 4)),

            Peg("e2", state: false, position: (2, 5)),
            Peg("e3", state: false, position: (3, 5)),
            Peg("e4", state: false, position: (4, 5)),
            ],
        lines: [
            ("a1", "a2"), ("a2", "a3"), ("a3", "a4"), ("a4", "a5"),
            ("b1", "b2"), ("b2", "b3"), ("b3", "b4"), ("b4", "b5"),
            ("c2", "c3"), ("c3", "c4"),
            ("e2", "e3"), ("e3", "e4"),

            ("a1", "b1"),
            ("a2", "b2"), ("b2", "c2"),
            ("a3", "b3"), ("b3", "c3"), ("c3", "d3"), ("d3", "e3"),
            ("a4", "b4"), ("b4", "c4"),
            ("a5", "b5"),
            ])}


    static var alien: Board { return Board(
        name: "Alien",
        pegs: [
            Peg("a2", state: false, position: (2, 1)),
            Peg("a8", state: false, position: (8, 1)),

            Peg("b3", state: false, position: (3, 2)),
            Peg("b7", state: false, position: (7, 2)),

            Peg("c1", state: false, position: (1, 3)),
            Peg("c3", state: false, position: (3, 3)),
            Peg("c5", state: false, position: (5, 3)),
            Peg("c7", state: false, position: (7, 3)),
            Peg("c9", state: false, position: (9, 3)),

            Peg("d1", state: false, position: (1, 4)),
            Peg("d3", state: true,  position: (3, 4)),
            Peg("d5", state: false, position: (5, 4)),
            Peg("d7", state: true,  position: (7, 4)),
            Peg("d9", state: false, position: (9, 4)),

            Peg("e1", state: false, position: (1, 5)),
            Peg("e3", state: false, position: (3, 5)),
            Peg("e5", state: false, position: (5, 5)),
            Peg("e7", state: false, position: (7, 5)),
            Peg("e9", state: false, position: (9, 5)),
            ],
        lines: [
            ("a2", "b3"), ("b3", "c3"),
            ("a8", "b7"), ("b7", "c7"),

            ("c1", "c3"), ("c3", "c5"), ("c5", "c7"), ("c7", "c9"),
            ("d1", "d3"), ("d3", "d5"), ("d5", "d7"), ("d7", "d9"),
            ("e1", "e3"), ("e3", "e5"), ("e5", "e7"), ("e7", "e9"),

            ("c1", "d1"), ("d1", "e1"),
            ("c3", "d3"), ("d3", "e3"),
            ("c5", "d5"), ("d5", "e5"),
            ("c7", "d7"), ("d7", "e7"),
            ("c9", "d9"), ("d9", "e9"),
            ])}


    static var whale: Board { return Board(
        name: "Whale",
        pegs: [
            Peg("a2", state: true, position: (2, 1)),
            Peg("a4", state: true, position: (4, 1)),
            Peg("a8", state: true, position: (8, 1)),

            Peg("b1", state: true, position: (1, 2)),
            Peg("b3", state: false, position: (3, 2)),
            Peg("b5", state: true, position: (5, 2)),
            Peg("b9", state: true, position: (9, 2)),

            Peg("c2", state: true, position: (2, 3)),
            Peg("c4", state: true, position: (4, 3)),
            Peg("c6", state: true, position: (6, 3)),
            Peg("c8", state: true, position: (8, 3)),

            Peg("d3", state: true, position: (3, 4)),
            Peg("d5", state: true, position: (5, 4)),
            Peg("d7", state: true, position: (7, 4)),
            ],
        lines: [
            ("a2", "a4"),
            ("b1", "b3"), ("b3", "b5"),
            ("c2", "c4"), ("c4", "c6"), ("c6", "c8"),
            ("d3", "d5"), ("d5", "d7"),

            ("b1", "c2"), ("c2", "d3"),
            ("a2", "b3"), ("b3", "c4"), ("c4", "d5"),
            ("a4", "b5"), ("b5", "c6"), ("c6", "d7"),
            ("a8", "b9"),
            
            ("a2", "b1"),
            ("a4", "b3"), ("b3", "c2"),
            ("b5", "c4"), ("c4", "d3"),
            ("c6", "d5"),
            ("b9", "c8"), ("c8", "d7"),
            ])}
}
