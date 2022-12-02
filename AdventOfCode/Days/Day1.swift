//
//  Day1.swift
//  AdventOfCode
//

import Algorithms
import Foundation

final class Day1: Day {
  
  enum ValidationError: Error {
    case unexpectedLine
  }
  
  
  func buildAndSortElfs (_ input: String) throws -> [Int]
  {
    var elfs : [Int] = []
    var elf = 0
    for i in input.split(separator: "\n", omittingEmptySubsequences: false) {
      if let i = Int(i) {
        elf += i
      } else if i == "" {
        elfs.append(elf)
        elf = 0
      } else {
        throw ValidationError.unexpectedLine
      }
    }
    if elf > 0 {
      elfs.append(elf)
    }
    return elfs.sorted()
  }
  
    func part1(_ input: String) -> CustomStringConvertible {
      return try! buildAndSortElfs(input).last!
    }

    func part2(_ input: String) -> CustomStringConvertible {
      return try! buildAndSortElfs(input).suffix(3).reduce(0, +)
    }
}
