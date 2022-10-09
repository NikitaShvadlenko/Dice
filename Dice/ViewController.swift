import UIKit

class ViewController: UIViewController {

    let mainScreenView = MainScreenView()

    override func loadView() {
        view = mainScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
