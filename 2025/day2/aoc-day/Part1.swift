import Foundation

class Part1 {
    let ranges: [IdRange]

    init(contents: String) throws {
        ranges = try parseRanges(contents)
    }

    func solve() throws {
        var sum = 0
        for range in ranges {
            for num in range.start ... range.end {
                let str = num.str
                guard str.count.isMultiple(of: 2) else { continue }
                let midIndex = str.index(str.startIndex, offsetBy: str.count / 2)
                let firstHalf = String(str[..<midIndex])
                let secondHalf = String(str[midIndex...])
                if firstHalf == secondHalf { sum += num }
            }
        }
        print("Part 1:", sum)
    }
}
