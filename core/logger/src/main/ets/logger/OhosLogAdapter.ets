import { LogAdapter } from './LogAdapter';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Logger } from './Logger';

export class OhosLogAdapter implements LogAdapter {
  private globalTag: string;
  private format: string = '%{public}s, %{public}s';
  private domain: number = 0xFF00;

  public constructor(tag: string, domain: number | null = null) {
    this.globalTag = tag;
    if (null != domain) {
      this.domain = domain;
    }
  }

  getTag(tag: string | null): string {
    if (null == tag) {
      return this.globalTag;
    } else {
      return this.globalTag + '-' + tag;
    }
  }

  isLoggable(priority: number, tag: string | null): boolean {
    return true;
  }

  log(priority: number, tag: string | null, message: string): void {
    if (priority == Logger.DEBUG) {
      hilog.debug(this.domain, tag, this.format, message)
    } else if (priority == Logger.INFO) {
      hilog.info(this.domain, tag, this.format, message)
    } else if (priority == Logger.WARN) {
      hilog.warn(this.domain, tag, this.format, message)
    } else if (priority == Logger.ERROR) {
      hilog.error(this.domain, tag, this.format, message)
    }
  }
}