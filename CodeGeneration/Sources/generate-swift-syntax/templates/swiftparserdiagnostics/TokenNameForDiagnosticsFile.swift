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

import SwiftSyntax
import SwiftSyntaxBuilder
import SyntaxSupport
import Utils

let tokenNameForDiagnosticFile = SourceFileSyntax(leadingTrivia: copyrightHeader) {
  DeclSyntax("@_spi(RawSyntax) import SwiftSyntax")

  try! ExtensionDeclSyntax("extension TokenKind") {
    try! VariableDeclSyntax("var nameForDiagnostics: String") {
      try! SwitchExprSyntax("switch self") {
        for tokenSpec in Token.allCases.map(\.spec) where tokenSpec.kind != .keyword {
          SwitchCaseSyntax("case .\(tokenSpec.varOrCaseName):") {
            StmtSyntax("return \(literal: tokenSpec.nameForDiagnostics)")
          }
        }
        SwitchCaseSyntax("case .keyword(let keyword):") {
          StmtSyntax("return String(syntaxText: keyword.defaultText)")
        }
      }
    }
  }
}
