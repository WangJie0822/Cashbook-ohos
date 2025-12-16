import { PromptAction } from '@kit.ArkUI';
import { type BusinessError } from '@kit.BasicServicesKit';
import { Logger } from 'logger';
import { StorageKey } from '../enums/Enums';

const TAG: string = '[HMOS_Toast]';

class Toast {
  private longToastTime: number = 2000;

  public showToast(message: ResourceStr, duration?: number) {
    try {
      const uiContext: UIContext = AppStorage.get(StorageKey.UI_CONTEXT)!;
      const promptAction: PromptAction = uiContext.getPromptAction();
      promptAction.showToast({
        message: message,
        duration: duration,
      });
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      Logger.e(TAG, `Show toast error, the code is ${error.code}}, the message is ${error.message}`);
    }
  }

  public showLongToast(message: ResourceStr) {
    this.showToast(message, this.longToastTime);
  }
}

export default new Toast();