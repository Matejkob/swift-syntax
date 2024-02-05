//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2024 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

// This test file has been translated from swift/test/Parse/delayed_extension.swift

import XCTest

final class DelayedExtensionTests: ParserTestCase {
  func testDelayedExtension1() {
    assertParse(
      """
      extension X { }
      _ = 1
      f()
      """
    )
  }

}
