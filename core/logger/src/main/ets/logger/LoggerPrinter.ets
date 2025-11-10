import { LogAdapter } from './LogAdapter';
import { Printer } from './Printer';
import { ArrayList } from '@kit.ArkTS';
import { Logger } from './Logger';

export class LoggerPrinter implements Printer {
  private TAG = 'Cashbook'
  private logAdapters = new ArrayList<LogAdapter>();

  addAdapter(adapter: LogAdapter): void {
    try {
      this.logAdapters.add(adapter)
    } catch (error) {
      // TODO: Implement error handling.
    }
  }

  clearAdapters(): void {
    try {
      this.logAdapters.clear()
    } catch (error) {
      // TODO: Implement error handling.
    }
  }

  d(tag: string | null, message: string): void {
    this.log(Logger.DEBUG, tag, message)
  }

  i(tag: string | null, message: string): void {
    this.log(Logger.INFO, tag, message)
  }

  w(tag: string | null, message: string): void {
    this.log(Logger.WARN, tag, message)
  }

  e(tag: string | null, message: string): void {
    this.log(Logger.ERROR, tag, message)
  }

  log(priority: number, tag: string | null, message: string | null): void {
    if (null == message) {
      message = 'Empty/NULL log message';
    }
    for (let adapter of this.logAdapters) {
      if (adapter.isLoggable(priority, tag)) {
        adapter.log(priority, adapter.getTag(tag), message)
      }
    }
  }
}