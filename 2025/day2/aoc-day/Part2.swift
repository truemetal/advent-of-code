import Foundation

class Part2 {
    let ranges: [IdRange]

    init(contents: String) throws {
        ranges = try parseRanges(contents)
    }

    func solve() throws {
        var sum = 0
        var set: [Int] = []
        for range in ranges {
            for num in range.start ... range.end {
                let str = num.str
                for subStrLen in (1 ... (str.count.dbl / 2.0).rounded(.up).int).reversed() {
                    guard str.count >= 2, str.count % subStrLen == 0 else { continue }
                    if substrings(of: str, length: subStrLen).set.count == 1 {
                        sum += num
                        set.append(num)
                        break
                    }
                }
            }
        }

        print("Part 2:", sum)
    }

    func substrings(of str: String, length: Int) -> [String] {
        guard length > 0 else { return [] }

        var result: [String] = []
        var index = str.startIndex

        while index < str.endIndex {
            let nextIndex = str.index(index, offsetBy: length, limitedBy: str.endIndex) ?? str.endIndex
            result.append(str[index ..< nextIndex].str)
            index = nextIndex
        }

        return result
    }
}
