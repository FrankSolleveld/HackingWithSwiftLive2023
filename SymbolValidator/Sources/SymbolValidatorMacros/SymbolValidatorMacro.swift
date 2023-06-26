import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics
import Cocoa

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

public struct URLMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("Error: #symbol requires an image name.")
        }

        let urlString = argument.description.replacingOccurrences(of: "\"", with: "")

        guard let _ = URL(string: urlString) else {
            let error = Diagnostic(node: Syntax(node), message: SymbolDiagnostic.badString(name: urlString))
            context.diagnose(error)

            return argument
        }

        return "URL(string: \(argument))!"
    }
}

// #symbol("plus")
public struct SymbolMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("Error: #symbol requires an image name.")
        }

        let imageName = argument.description.replacingOccurrences(of: "\"", with: "")
        let image = NSImage(systemSymbolName: imageName, accessibilityDescription: nil)

        guard image != nil else {
            let error = Diagnostic(node: Syntax(node), message: SymbolDiagnostic.badSymbol(name: imageName))
            context.diagnose(error)

            return argument
        }

        return argument
    }
}

enum SymbolDiagnostic: DiagnosticMessage {
    case badSymbol(name: String)
    case badString(name: String)

    var severity: DiagnosticSeverity {
        switch self {
        case .badSymbol, .badString:
                .error
        }
    }

    var message: String {
        switch self {
        case let .badSymbol(name):
            "The symbol \(name) does not exist."
        case .badString:
            "The given string did not produce a correct URL."
        }
    }

    var diagnosticID: MessageID {
        switch self {
        case .badSymbol:
            MessageID(domain: "SymbolValidatorMacros", id: "Missing Symbol")
        case .badString:
            MessageID(domain: "SymbolValidatorMacros", id: "Incorrect String")
        }
    }
}

@main
struct SymbolValidatorPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        SymbolMacro.self,
        URLMacro.self
    ]
}
