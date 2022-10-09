import UIKit
import SnapKit

protocol RollButtonDelegate: AnyObject {
    func mainScreenViewDidPressRollButton(
        _ mainScreenView: MainScreenView
    )
}

final class MainScreenView: UIView {

    weak var rollButtonDelegate: RollButtonDelegate?

    private lazy var backgroundView: UIView = {
        let containerView = UIView()
        let imageView = UIImageView()
        imageView.image = Asset.greenBackground.image
        imageView.contentMode = .scaleToFill
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return containerView
    }()

    private lazy var dice1View: UIImageView = {
        let view = UIImageView()
        view.image = Asset.diceOne.image
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var dice2View: UIImageView = {
        let view = UIImageView()
        view.image = Asset.diceOne.image
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [dice1View, dice2View])
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        stackview.spacing = 80
        return stackview
    }()

    private lazy var appLogoView: UIImageView = {
        let view = UIImageView()
        view.image = Asset.diceeLogo.image
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var rollButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Asset.Colors.rollButtonColor.color
        button.setTitle(L10n.roll, for: .normal)
        button.layer.cornerRadius = 5
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchDown)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                appLogoView,
                horizontalStackView
            ]
        )

        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
extension MainScreenView {
    private func setupView() {
        addSubview(backgroundView)
        backgroundView.addSubview(stackView)
        backgroundView.addSubview(rollButton)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(snp.centerY).multipliedBy(1.5)
        }

        rollButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(60)
            make.top.equalTo(stackView.snp.bottom)
        }
    }

    @objc
    private func rollButtonPressed() {
        rollButtonDelegate?.mainScreenViewDidPressRollButton(self)
    }
}
