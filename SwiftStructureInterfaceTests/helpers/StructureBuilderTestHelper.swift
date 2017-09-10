@testable import SwiftStructureInterface

class StructureBuilderTestHelper {

    static func build(from string: String) -> SwiftFile? {
        return SKElementFactory().build(from: string) as? SwiftFile
    }

    static func build(fromPath path: String) -> SwiftFile? {
        return SKElementFactory().build(fromPath: path) as? SwiftFile
    }
}
