import Darwin

func pow(_ lhs: Int, _ rhs: Int) -> Int {
    return Int(pow(Double(lhs), Double(rhs)))
}
