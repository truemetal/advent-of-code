import Foundation

class Part2 {
    let steps: [Int]

    init(contents: String) throws {
        steps = contents
            .split(separator: "\n")
            .map { $0.replacingOccurrences(of: "R", with: "").replacingOccurrences(of: "L", with: "-") }
            .map { Int($0)! }
    }

    func solve() throws {
        var states = [50]

        var count = 0

        steps.forEach { step in
            let last = states.last!

            var new: Int
            if step > 0 {
                new = last + step
                count += new / 100
//                print("adj step: \(step):", new / 100)
                new = new % 100
            }
            else {
                let adjust = (100 - last) + (step * -1)
                count += adjust / 100
                if last == 0 { count -= 1 }
//                print("adj step: \(step):", adjust / 100)
                new = (100 - adjust % 100) % 100
            }

//            if new == 0 {
////                count += 1
//                print("and one more")
//            }
            states.append(new)
        }

        print("Part 2:", count)
    }
}
