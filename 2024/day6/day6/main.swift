import Foundation

//let contents = testInput
let contents = realInput

let start = Date()
try Part1(contents: contents).solve()
try await Part2(contents: contents).solve()
print("finished in \(Date().timeIntervalSince(start)) seconds")
