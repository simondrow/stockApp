import UIKit

enum AppColor {
    static let accent = UIColor.systemGreen
    static let background = UIColor.systemBackground
    static let primaryText = UIColor.label
    static let secondaryText = UIColor.secondaryLabel
    static let cardBackground = UIColor.secondarySystemBackground
}

enum AppFont {
    static let title = UIFont.systemFont(ofSize: 34, weight: .bold)
    static let headline = UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let body = UIFont.systemFont(ofSize: 17, weight: .regular)
}

enum AppSpacing {
    static let extraSmall: CGFloat = 4
    static let small: CGFloat = 8
    static let medium: CGFloat = 12
    static let large: CGFloat = 16
    static let extraLarge: CGFloat = 24
}

extension UIView {
    func applyStandardCardStyle() {
        backgroundColor = AppColor.cardBackground
        layer.cornerRadius = AppSpacing.small
        layer.cornerCurve = .continuous
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = AppSpacing.small
        layer.shadowOffset = CGSize(width: 0, height: AppSpacing.extraSmall)
    }
}
