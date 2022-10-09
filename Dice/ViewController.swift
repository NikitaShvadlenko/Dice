import UIKit

class ViewController: UIViewController {

    let mainScreenView = MainScreenView()
    var casinoManager = CasinoManager()

    override func loadView() {
        view = mainScreenView
    }

    override func becomeFirstResponder() -> Bool {
        true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenView.rollButtonDelegate = self
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            casinoManager.rollDice()
        }
    }
}

// MARK: - RollButtonDelegate
extension ViewController: RollButtonDelegate {
    func mainScreenViewDidPressRollButton(_ mainScreenView: MainScreenView) {
        casinoManager.rollDice()
        mainScreenView.configure(
            diceOneImage: ValueToImageConverter.diceImage(for: casinoManager.diceOne),
            diceTwoImage: ValueToImageConverter.diceImage(for: casinoManager.diceTwo)
        )
    }
}
