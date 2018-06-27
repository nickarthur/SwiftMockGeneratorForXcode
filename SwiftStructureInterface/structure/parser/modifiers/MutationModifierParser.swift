import Lexer

class MutationModifierParser: Parser<MutationModifier> {

    static let modifiers: [(Token.Kind, String)] = [
        (.mutating, "mutating"),
        (.nonmutating, "nonmutating"),
    ]

    override func parse() throws -> MutationModifier {
        if isNext([.mutating, .nonmutating]) {
            return try MutationModifierImpl(children: builder()
                    .required { try self.parseKeyword() }
                    .build())
        }
        throw LookAheadError()
    }
}
