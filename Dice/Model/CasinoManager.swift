import Foundation

class CasinoManager {
    var view: MainScreenView?

     public func rollDice() {
        let diceOne = Int.random(in: 1...6)
        let diceTwo = Int.random(in: 1...6)
        view?.configure(
            diceOneImage: ValueToImageConverter.diceImage(for: diceOne),
            diceTwoImage: ValueToImageConverter.diceImage(for: diceTwo)
        )
    }
}
