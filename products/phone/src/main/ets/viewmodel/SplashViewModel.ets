import { BaseState, BaseViewModel, PageContext, StorageKey } from 'design';

export class SplashViewModel extends BaseViewModel<BaseState> {
  private pageContext: PageContext = AppStorage.get(StorageKey.MAIN_PAGE_CONTEXT) as PageContext;

  constructor() {
    super(new BaseState())
  }

  public sendEvent(event: SplashEvent): void {
    if (event == SplashEvent.JUMP_TO_MAIN) {
      this.pageContext.replacePage({
        routerName: 'MainPage'
      })
    }
  }
}

export enum SplashEvent {
  JUMP_TO_MAIN
}

