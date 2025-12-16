import type { common, StartOptions, Want } from '@kit.AbilityKit';
import type { BusinessError } from '@kit.BasicServicesKit';
import device from '@ohos.deviceInfo';
import { Logger } from 'logger';
import { appManager } from '../../../../Index';

const TAG = 'ProcessUtil';

export class ProcessUtil {
  public static terminateAbility(context?: common.UIAbilityContext): void {
    if (!context) {
      context = appManager.getContext() as common.UIAbilityContext
    }
    try {
      context.terminateSelf().then(() => {
        Logger.i(TAG, 'terminateSelf succeed');
      }).catch((err: BusinessError) => {
        Logger.e(TAG, `terminateSelf failed. Cause ${err.code}, ${err.message}.`);
      });
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.e(TAG, `terminateSelf failed error:${err.code}, ${err.message}.`);
    }
  }

  public static moveAbilityToBackground(context: common.UIAbilityContext): void {
    try {
      Logger.i(TAG, `moveAbilityToBackground, platform = ${device.osFullName}`)
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.e(TAG, `moveAbilityToBackground failed error: ${err.code}, ${err.message}`);
    }
  }

  public static startAbility(context: common.UIAbilityContext, want: Want, options?: StartOptions): Promise<boolean> {
    try {
      return context.startAbility(want, options).then(() => {
        Logger.i(TAG, 'startAbility succeed');
        return true;
      }).catch((err: BusinessError) => {
        Logger.e(TAG, `startAbility failed, cause ${err.code}, ${err.message}`);
        return false;
      });
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.e(TAG, `startAbility failed error: ${err.code}, ${err.message}`);
      return Promise.resolve(false);
    }
  }
}