@Entry
@Component
struct Index {
  build() {
    Stack() {
      Navigation() {
        Column() {
          Image($r('app.media.ic_rmb'))
            .width(100)
            .height(100)
            .backgroundColor('#ff0066ff')
            .padding('20')
            .fillColor('#fff')

          Text("欢迎使用记账本")
        }
      }
      .mode(NavigationMode.Auto)
      .width('100%')
      .height('100%')
    }.linearGradient({
      angle: 180, // 渐变角度（默认180度）
      colors: [
        ['#F3FEFF', 0], // 起始颜色及位置
        ['#F3FEFF', 0.5], // 中间过渡颜色
        ['#FFD9E1', 1]// 结束颜色
      ]
    })
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}