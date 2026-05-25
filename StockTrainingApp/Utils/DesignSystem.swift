import SwiftUI

enum AppColor {
    static let accent = Color.accentColor
    static let background = Color(uiColor: .systemBackground)
    static let primaryText = Color(uiColor: .label)
    static let secondaryText = Color(uiColor: .secondaryLabel)
    static let cardBackground = Color(uiColor: .secondarySystemBackground)
}

enum AppFont {
    static let title = Font.system(.largeTitle, design: .rounded, weight: .bold)
    static let headline = Font.system(.headline, design: .rounded, weight: .semibold)
    static let body = Font.system(.body, design: .default, weight: .regular)
}

enum AppSpacing {
    static let extraSmall: CGFloat = 4
    static let small: CGFloat = 8
    static let medium: CGFloat = 12
    static let large: CGFloat = 16
    static let extraLarge: CGFloat = 24
}

private struct StandardCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(AppSpacing.large)
            .background(AppColor.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: AppSpacing.small, style: .continuous))
            .shadow(color: .black.opacity(0.08), radius: AppSpacing.small, y: AppSpacing.extraSmall)
    }
}

extension View {
    func standardCardStyle() -> some View {
        modifier(StandardCardModifier())
    }
}
