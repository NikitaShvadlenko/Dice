import UIKit

class ViewController: UIViewController {

    let mainScreenView = MainScreenView()

    override func loadView() {
        view = mainScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenView.rollButtonDelegate = self
    }
}

extension ViewController: RollButtonDelegate {
    func mainScreenViewDidPressRollButton(_ mainScreenView: MainScreenView) {
        let diceOne = Int.random(in: 1...6)
        let diceTwo = Int.random(in: 1...6)
        mainScreenView.configure(
            diceOneImage: ValueToImageConverter.diceImage(for: diceOne),
            diceTwoImage: ValueToImageConverter.diceImage(for: diceTwo)
        )
    }
}
