import { SettingsRepository } from 'data';
import { BaseState, BaseViewModel, PageContext, StorageKey } from 'design';
import { Logger } from 'logger';

const TAG = "SplashViewModel"

export class SplashViewModel extends BaseViewModel<BaseState> {
  private pageContext: PageContext
  private settingsRepository: SettingsRepository

  constructor(pageContext: PageContext, settingsRepository: SettingsRepository) {
    super(new BaseState())
    this.pageContext = pageContext
    this.settingsRepository = settingsRepository
  }

  public sendEvent(event: SplashEvent): void {
    if (event == SplashEvent.JUMP_TO_MAIN) {
      if (this.settingsRepository.isPrivacyAgreementAccepted()) {
        Logger.i(TAG, "jumpToMainPage")
        this.pageContext.replacePage({
          routerName: 'MainPage'
        })
      } else {
        Logger.i(TAG, "jumpToPrivacyAgreementPage")
        this.pageContext.replacePage({
          routerName: 'PrivacyAgreementPage'
        })
      }
    }
  }
}

export enum SplashEvent {
  JUMP_TO_MAIN
}

