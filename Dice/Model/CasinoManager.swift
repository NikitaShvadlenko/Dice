import Foundation

class CasinoManager {
    var diceOne: Int = 0
    var diceTwo: Int = 0

    public func rollDice() {
        diceOne = Int.random(in: 1...6)
        diceTwo = Int.random(in: 1...6)
    }
}
