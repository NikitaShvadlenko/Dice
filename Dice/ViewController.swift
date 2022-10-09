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
        print("Button Pressed")
    }
}
