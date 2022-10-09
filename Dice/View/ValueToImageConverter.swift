import UIKit

final class ValueToImageConverter {
    static func diceImage(for value: Int ) -> UIImage {
        switch value {
        case 1:
            return Asset.diceOne.image
        case 2:
            return Asset.diceTwo.image
        case 3:
            return Asset.diceThree.image
        case 4:
            return Asset.diceFour.image
        case 5:
            return Asset.diceFive.image
        case 6:
            return Asset.diceSix.image

        default:
            return Asset.diceeLogo.image
        }
    }
}
