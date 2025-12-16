import { ProcessUtil } from 'common'
import { settingsRepository } from 'data'
import { bodyTextModifier, PageContext, StorageKey, titleTextModifier, UIConstants } from 'design'

@Builder
export function PrivacyAgreementPageBuilder() {
  PrivacyAgreementPage()
}

@Component({ freezeWhenInactive: true })
struct PrivacyAgreementPage {
  private pageContext: PageContext = AppStorage.get(StorageKey.MAIN_PAGE_CONTEXT) as PageContext

  build() {
    NavDestination() {

      Image($r('app.media.foreground'))
        .backgroundImage($r('app.media.background'), {})
        .size({ width: 100, height: 100 })
        .borderRadius(20)
        .clip(true)
        .margin({ top: 120 })

      Text($r('app.string.app_name'))
        .attributeModifier(titleTextModifier)
        .margin({ top: 20 })

      Text("欢迎使用记账本APP！我们非常尊重并保护所有使用服务用户的个人隐私权，在使用记账本各项服务前，请您务必仔细阅读、透彻理解并同意接受《用户协议和隐私政策》后，再开始使用我们的服务。")
        .attributeModifier(bodyTextModifier)
        .margin(20)

      Row() {
        Button("拒绝并关闭")
          .buttonStyle(ButtonStyleMode.TEXTUAL)
          .onClick(() => {
            ProcessUtil.terminateAbility()

          })
        Button("同意并继续")
          .onClick(() => {
            settingsRepository.setPrivacyAgreementAccepted(true)
            this.pageContext.replacePage({
              routerName: "MainPage"
            })
          })
      }
      .layoutWeight(1)
      .width(UIConstants.MATCH_PERCENT)
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.Center)
      .margin(20)

    }
    .hideTitleBar(true)
    .transition(TransitionEffect.OPACITY)
    .height(UIConstants.MATCH_PERCENT)
    .width(UIConstants.MATCH_PERCENT)
  }
}