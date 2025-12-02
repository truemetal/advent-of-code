import Foundation

class Part1 {
    let steps: [Int]

    init(contents: String) throws {
        steps = contents
            .split(separator: "\n")
            .map { $0.replacingOccurrences(of: "R", with: "").replacingOccurrences(of: "L", with: "-") }
            .map { Int($0)! }
    }

    func solve() throws {
        var states = [50]

        steps.forEach { step in
            let last = states.last!
            var new = (last + step) % 100
            new = new < 0 ? new + 100 : new
            states.append(new)
        }

        let count = states.count { $0 == 0 }

        print("Part 1:", count)
    }
}
