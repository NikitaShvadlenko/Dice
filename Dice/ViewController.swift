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
        casinoManager.view = mainScreenView
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
    }
}
