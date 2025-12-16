export abstract class BaseViewModel<T extends BaseState> {
  protected state: T;

  public constructor(initialState: T) {
    this.state = initialState;
  }

  public getState(): T {
    return this.state;
  }

  public abstract sendEvent(event: BaseEvent)
}

export class BaseState {
}

export interface BaseEvent {}