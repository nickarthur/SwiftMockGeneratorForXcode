import XCTest
@testable import SwiftStructureInterface

class GenericParameterClauseParserTests: XCTestCase {

    // MARK: - parse

    func test_parse_shouldParseEmptyClause() {
        XCTAssert(parse("") === SwiftGenericParameterClause.errorGenericParameterClause)
    }

    func test_parse_shouldParseSimpleClause() {
        assertText("<T>", "<T>")
    }

    func test_parse_shouldParseArgumentWithTypeConformance() {
        assertText("<T: A>", "<T: A>")
    }

    func test_parse_shouldParseArgumentWithProtocolComposition() {
        assertText("<T: A & B>", "<T: A & B>")
    }

    func test_parse_shouldParseArguments() {
        assertText("<T, U: A, V: A & B>", "<T, U: A, V: A & B>")
    }

    // MARK: - Helpers

    func assertText(_ input: String, _ expected: String, line: UInt = #line) {
        assertElementText(parse(input), input, line: line)
    }

    func parse(_ text: String) -> Element {
        let parser = createParser(text, GenericParameterClauseParser.self)
        return parser.parse()
    }
}