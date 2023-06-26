// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.

import Foundation

@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "SymbolValidatorMacros", type: "StringifyMacro")

@freestanding(expression)
public macro symbol(_ systemName: String) -> String = #externalMacro(module: "SymbolValidatorMacros", type: "SymbolMacro")

@freestanding(expression)
public macro URL(_ urlString: String) -> URL = #externalMacro(module: "SymbolValidatorMacros", type: "URLMacro")
