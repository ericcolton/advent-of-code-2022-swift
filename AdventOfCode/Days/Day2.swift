//
//  Day2.swift
//  AdventOfCode
//

import Foundation

final class Day2: Day {
  
  let ASCII_A = 65
  let ASCII_X = 88
  
  func scoreAsPlay(_ input : String) -> Int
  {
    let pair = input.components(separatedBy: " ")
    let a = Int(Character(pair[0]).asciiValue!) - ASCII_A
    let b = Int(Character(pair[1]).asciiValue!) - ASCII_X
    if a == b {
      return 3 + b + 1
    } else if b == (a + 1) % 3 {
      return 6 + b + 1
    } else {
      return 0 + b + 1
    }
  }
  
  func determineB(_ a: Int, _ outcome: Int) -> Int
  {
    if outcome == 0 {
      if a == 0 {
        return 2
      }
      return (a - 1) % 3
    } else if outcome == 3 {
      return a
    }
    return (a + 1) % 3
  }
  
  func scoreAsOutcome(_ input : String) -> Int
  {
    let pair = input.components(separatedBy: " ")
    let a = Int(Character(pair[0]).asciiValue!) - ASCII_A
    let rawOutcome = Int(Character(pair[1]).asciiValue!) - ASCII_X
    let outcome = 3 * rawOutcome
    return outcome + determineB(a, outcome) + 1
  }
  
  func part1(_ input: String) -> CustomStringConvertible {
    return input
      .split(separator: "\n")
      .map { scoreAsPlay(String($0)) }
      .reduce(0, +)
    }

    func part2(_ input: String) -> CustomStringConvertible {
      return input
        .split(separator: "\n")
        .map { scoreAsOutcome(String($0)) }
        .reduce(0, +)
    }
}
