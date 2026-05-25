import UIKit

final class MainViewController: UIViewController {
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let contentStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureHierarchy()
        configureLayout()
    }

    private func configureView() {
        view.backgroundColor = AppColor.background

        iconView.image = UIImage(systemName: "chart.line.uptrend.xyaxis")
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = AppColor.accent

        titleLabel.text = "炒股训练"
        titleLabel.font = AppFont.title
        titleLabel.textColor = AppColor.primaryText
        titleLabel.textAlignment = .center

        subtitleLabel.text = "Phase 1 UIKit 项目骨架已初始化"
        subtitleLabel.font = AppFont.body
        subtitleLabel.textColor = AppColor.secondaryText
        subtitleLabel.textAlignment = .center

        contentStack.axis = .vertical
        contentStack.alignment = .center
        contentStack.spacing = AppSpacing.large
        contentStack.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureHierarchy() {
        view.addSubview(contentStack)
        contentStack.addArrangedSubview(iconView)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(subtitleLabel)
    }

    private func configureLayout() {
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            contentStack.leadingAnchor.constraint(
                greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: AppSpacing.extraLarge
            ),
            contentStack.trailingAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -AppSpacing.extraLarge
            ),
            iconView.widthAnchor.constraint(equalToConstant: 64),
            iconView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
