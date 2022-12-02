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
    let newArray: [Int] = [0]
    let elfs = input.split(separator: "\n", omittingEmptySubsequences: false)
    return elfs
      .reduce(into: newArray) { (newArray, l) in
        if l == "" {
          newArray.append(0)
        } else {
          newArray[newArray.endIndex-1] += Int(l)!
        }
      }.sorted()
  }
  
    func part1(_ input: String) -> CustomStringConvertible {
      return try! buildAndSortElfs(input).last!
    }

    func part2(_ input: String) -> CustomStringConvertible {
      return try! buildAndSortElfs(input).suffix(3).reduce(0, +)
    }
}
