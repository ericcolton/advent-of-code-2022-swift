//
//  Day1.swift
//  AdventOfCode
//

import Algorithms
import Foundation

//@available(macOS 13.0, *)
final class Day1: Day {
  
  func buildAndSortElfs(_ input: String) -> [Int]
  {
    return input.components(separatedBy: "\n\n")
      .map() {
        $0.components(separatedBy: "\n")
          .map() { Int($0)! }
          .reduce(0, +)
      }.sorted()
  }
  
    func part1(_ input: String) -> CustomStringConvertible {
      let part1 = buildAndSortElfs(input).last!
      assert(part1 == 70116)
      return part1
    }

    func part2(_ input: String) -> CustomStringConvertible {
      let part2 = buildAndSortElfs(input).suffix(3).reduce(0, +)
      assert (part2 == 206582)
      return part2
    }
}
