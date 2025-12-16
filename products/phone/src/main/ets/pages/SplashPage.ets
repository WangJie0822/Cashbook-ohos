import { settingsRepository } from 'data'
import { PageContext, StorageKey, UIConstants } from 'design'
import { SplashEvent, SplashViewModel } from '../viewmodel/SplashViewModel'

@Entry
@Component
struct SplashPage {
  private pageContext: PageContext = AppStorage.get(StorageKey.MAIN_PAGE_CONTEXT) as PageContext
  private viewModel: SplashViewModel = new SplashViewModel(this.pageContext, settingsRepository)

  aboutToAppear(): void {
    this.getUIContext().animateTo({
      delay: 500,
      duration: 220,
      onFinish: () => {
        this.viewModel.sendEvent(SplashEvent.JUMP_TO_MAIN)
      }
    }, () => {

    })
  }

  build() {
    Navigation(this.pageContext.navPathStack)
      .mode(NavigationMode.Auto)
      .backgroundColor($r('app.color.start_window_background'))
      .width(UIConstants.MATCH_PERCENT)
      .height(UIConstants.MATCH_PERCENT)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}