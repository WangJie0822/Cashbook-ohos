import { Logger } from 'logger';

export interface RouterParam {
  routerName: string;
  param?: object;
}

export interface IPageContext {

  openPage(data: RouterParam, animated?: boolean): void;

  popPage(animated?: boolean): void;

  replacePage(data: RouterParam, animated?: boolean): void;
}

const TAG = 'PageContext';

export class PageContext implements IPageContext {
  private readonly pathStack: NavPathStack;

  constructor() {
    this.pathStack = new NavPathStack();
  }

  public replacePage(data: RouterParam, animated: boolean = true): void {
    try {
      this.pathStack.replacePath({
        name: data.routerName,
        param: data.param,
      }, animated);
    } catch (err) {
      Logger.e(TAG, `Open Page ${data.routerName} failed. ${err.code} ${err.message}.`);
    }
  }

  public openPage(data: RouterParam, animated: boolean = true): void {
    try {
      this.pathStack.pushPath({
        name: data.routerName,
        param: data.param,
      }, animated);
    } catch (err) {
      Logger.e(TAG, `Open Page ${data.routerName} failed. ${err.code} ${err.message}.`);
    }
  }

  public popPage(animated: boolean = true): void {
    try {
      this.pathStack.pop(animated);
    } catch (err) {
      Logger.e(TAG, `Pop Page failed. ${err.code} ${err.message}.`);
    }
  }

  public get navPathStack(): NavPathStack {
    return this.pathStack;
  }
}