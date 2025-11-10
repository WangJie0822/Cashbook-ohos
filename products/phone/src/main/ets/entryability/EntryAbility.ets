import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { Logger, OhosLogAdapter } from 'logger';

const TAG = 'EntryAbility'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.addAdapter(new OhosLogAdapter('Cashbook'))
    Logger.i(TAG, 'Ability onCreate')
  }

  onDestroy(): void {
    Logger.i(TAG, 'Ability onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.i(TAG, 'Ability onWindowStageCreate')

    windowStage.loadContent('pages/SplashPage', (err) => {
      if (err.code) {
        Logger.i(TAG, 'Failed to load the content. Cause: ${JSON.stringify(err)}')
        return;
      }
      Logger.i(TAG, 'Succeeded in loading the content.')
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.i(TAG, 'Ability onWindowStageDestroy')
  }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.i(TAG, 'Ability onForeground')
  }

  onBackground(): void {
    // Ability has back to background
    Logger.i(TAG, 'Ability onBackground')
  }
}
