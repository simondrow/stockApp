# Swift & SwiftUI 代码规范与最佳实践 (Code Rules)

## 1. 核心工程约束
- **强制集成 SwiftLint（优先 SwiftPM 插件，不依赖 brew）**：项目必须通过 Swift Package Manager 引入 SwiftLint，并在 Target 的 Build Phases 中启用 SwiftLint Build Tool Plugin；规则配置放在工程根目录的 `.swiftlint.yml`。
- **零警告原则**：提交的代码原则上不应包含 Xcode 编译警告或 SwiftLint 警告，保持工程整洁。

## 2. 安全与语法 (Safety & Syntax)
- **严禁强制解包**：绝对避免使用 `!`。必须使用 `if let`、`guard let` 绑定，或使用 `??` 提供默认值。
- **优先不可变性**：默认使用 `let` 声明常量，仅在状态确实需要改变时才使用 `var`。
- **现代并发模型**：全面弃用旧版基于闭包的 GCD 异步回调，统一使用 `async/await` 和 `Task`。
- **线程安全**：所有涉及 UI 状态更新的 ViewModel 必须标记为 `@MainActor`，或确保在主线程执行。
- **内存泄漏防范**：在 Class 内部的逃逸闭包中，必须评估并使用 `[weak self]` 避免循环引用。

## 3. 架构与解耦 (Architecture: MVVM)
- **View (视图)**：只负责 UI 声明和事件绑定，**严禁**在 View 中编写业务计算或网络请求逻辑。
- **ViewModel (视图模型)**：处理所有的业务逻辑、数据转换，向 View 提供绑定的状态。
- **Service/Model (服务与模型)**：负责与后端 API 交互、本地数据持久化及核心算法。
- **控制视图规模**：单一 View 的 `body` 尽量控制在 50 行以内。遇到臃肿的视图必须拆分为细粒度的子 View。
- **严格的访问控制**：属性和方法默认使用 `private`，只向外暴露必要的 `public` 或 `internal` 接口。

## 4. SwiftUI 状态管理 (State Management)
- **`@State`**：仅用于 View 内部局部的、私有的 UI 状态（例如：弹窗显示隐藏、输入框文本）。
- **`@StateObject`**：仅用于在 View 中**初始化**拥有生命周期的 ViewModel。
- **`@ObservedObject`**：用于接收从父视图传递下来的 ViewModel 实例。
- **`@EnvironmentObject`**：仅用于跨层级的全局共享状态（例如：`AppState` 登录状态、全局配置）。

## 5. UI 组件化与风格 (Design System & UI Skills)
*参考原子化 UI 设计理念（如 web 端的 shadcn 风格），在 SwiftUI 中建立一致的设计系统。*
- **统一设计令牌 (Design Tokens)**：严禁在视图中硬编码颜色和间距。必须统一使用系统定义的 Semantic Colors（语义化颜色）或在 `Assets` 中统一定义。
- **Modifier 封装**：将常用的样式组合（如标准卡片投影、统一的按钮交互样式）封装为自定义的 `ViewModifier`（例如 `.standardCardStyle()`）。
- **推迟复杂业务组件**：Phase 1 仅聚焦基础设计系统和标准 UI 组件库的搭建。类似 K线图表（Charts）等复杂业务组件严格延后至 Phase 2 引入。
