import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: AppSpacing.large) {
            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.system(size: 56, weight: .semibold))
                .foregroundStyle(AppColor.accent)

            VStack(spacing: AppSpacing.small) {
                Text("炒股训练")
                    .font(AppFont.title)
                    .foregroundStyle(AppColor.primaryText)

                Text("Phase 1 项目骨架已初始化")
                    .font(AppFont.body)
                    .foregroundStyle(AppColor.secondaryText)
            }
        }
        .padding(AppSpacing.extraLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColor.background)
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
