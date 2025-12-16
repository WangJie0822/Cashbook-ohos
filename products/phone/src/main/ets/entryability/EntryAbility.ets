import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { PageContext, StorageKey } from 'design';
import { Logger, OhosLogAdapter } from 'logger';
import { appManager } from 'common';

const TAG = 'EntryAbility'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.addAdapter(new OhosLogAdapter('Cashbook'))
    Logger.i(TAG, `Ability onCreate launchReason: ${launchParam.launchReason}`)
    this.checkAndHandleParams(want);
    appManager.setContext(this.context)
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.i(TAG, `onNewWant launchReason: ${launchParam.launchReason}`);
    this.checkAndHandleParams(want);
  }

  checkAndHandleParams(want: Want): void {
    Logger.i(TAG, `checkAndHandleParams`);
    try {
      if (want === null || want.parameters === null || want === undefined || want.parameters === undefined) {
        return;
      }
    } catch (err) {
      Logger.e(TAG, `checkAndHandleParams failed: ${err}`);
    }
  }

  onDestroy(): void {
    Logger.i(TAG, 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.i(TAG, 'Ability onWindowStageCreate');

    AppStorage.setOrCreate(StorageKey.MAIN_PAGE_CONTEXT, new PageContext());

    windowStage.loadContent('pages/SplashPage', (err) => {
      try {
        AppStorage.setOrCreate(StorageKey.UI_CONTEXT, windowStage.getMainWindowSync().getUIContext());
      } catch (err) {
        Logger.e(TAG, `set ui context err: ${err}`);
      }
      if (err.code) {
        Logger.i(TAG, `Failed to load the content. Cause: ${JSON.stringify(err)}`);
        return;
      }
      Logger.i(TAG, 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.i(TAG, 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.i(TAG, 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    Logger.i(TAG, 'Ability onBackground');
  }
}
