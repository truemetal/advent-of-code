import Foundation

struct IdRange {
    let start: Int
    let end: Int
}

func parseRanges(_ contents: String) throws -> [IdRange] {
    let contents = contents.replacingOccurrences(of: "\n", with: "")
    let tokens = contents.components(separatedBy: ",")

    return tokens.map { token in
        let parts = token.split(separator: "-", maxSplits: 1)
        guard parts.count == 2, let start = parts[0].str.int, let end = parts[1].str.int else { fatalError() }
        return IdRange(start: start, end: end)
    }
}
