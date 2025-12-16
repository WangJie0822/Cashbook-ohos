export class AppManager {
  private declare context: Context;

  setContext(context: Context) {
    this.context = context;
  }

  getContext(): Context {
    return this.context;
  }
}