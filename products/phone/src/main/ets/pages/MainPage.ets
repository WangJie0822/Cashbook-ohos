import type { common } from '@kit.AbilityKit';
import { ProcessUtil } from 'common';
import { Toast, UIConstants } from 'design';

const PRESS_TIME = 1500;

@Builder
export function MainPageBuilder() {
  MainPage()
}

@Component({ freezeWhenInactive: true })
struct MainPage {
  private backPressTime: number = 0;

  onBackPress(): boolean {
    const newTime = new Date().getTime();
    if (this.backPressTime && newTime - this.backPressTime < PRESS_TIME) {
      ProcessUtil.terminateAbility(this.getUIContext().getHostContext() as common.UIAbilityContext);
      return false;
    }
    this.backPressTime = newTime;
    Toast.showToast($r('app.string.back_toast'));
    return true;
  }

  build() {
    NavDestination() {
      Text("HAHAHAHHA")
    }
    .hideTitleBar(true)
    .onBackPressed(() => {
      this.onBackPress();
      return true;
    })
    .transition(TransitionEffect.OPACITY)
    .height(UIConstants.MATCH_PERCENT)
    .width(UIConstants.MATCH_PERCENT)
  }
}