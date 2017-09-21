// RUN: %target-typecheck-verify-swift

func takeAny(_ left: Any, _ right: Any) -> Int? {
  return left as? Int
}

func throwing() throws -> Int? {}

func warnOptionalInStringInterpolationSegment(_ o : Int?) {
  print("Always some, Always some, Always some: \(o)")
  // expected-warning@-1 {{string interpolation produces a debug description for a value; did you mean to make this explicit?}}
  // expected-note@-2 {{use 'String(describing:)' to silence this warning}} {{51-51=String(describing: }} {{52-52=)}}
  var i: Int? = o
  print("Always some, Always some, Always some: \(i)")
  // expected-warning@-1 {{string interpolation produces a debug description for a value; did you mean to make this explicit?}}
  // expected-note@-2 {{use 'String(describing:)' to silence this warning}} {{51-51=String(describing: }} {{52-52=)}}
  i = nil
  print("Always some, Always some, Always some: \(o.map { $0 + 1 })")
  // expected-warning@-1 {{string interpolation produces a debug description for a value; did you mean to make this explicit?}}
  // expected-note@-2 {{use 'String(describing:)' to silence this warning}} {{51-51=String(describing: }} {{67-67=)}}

  print("Always some, Always some, Always some: \(o as Int?)") // No warning
  print("Always some, Always some, Always some: \(o.debugDescription)") // No warning.
}
