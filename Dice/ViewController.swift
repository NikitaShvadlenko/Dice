import UIKit

class ViewController: UIViewController {

    let mainScreenView = MainScreenView()

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
            rollDice()
        }
    }
}

// MARK: - RollButtonDelegate
extension ViewController: RollButtonDelegate {
    func mainScreenViewDidPressRollButton(_ mainScreenView: MainScreenView) {
        rollDice()
    }
}

// MARK: - Private Methods
extension ViewController {
    private func rollDice() {
        let diceOne = Int.random(in: 1...6)
        let diceTwo = Int.random(in: 1...6)
        mainScreenView.configure(
            diceOneImage: ValueToImageConverter.diceImage(for: diceOne),
            diceTwoImage: ValueToImageConverter.diceImage(for: diceTwo)
        )
    }
}
