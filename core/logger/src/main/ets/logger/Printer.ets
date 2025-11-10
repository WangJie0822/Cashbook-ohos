import { LogAdapter } from './LogAdapter'

/**
 * 日志打印接口
 *
 * @author <a href="mailto:15555650921@163.com">王杰</a> 创建于 2025/11/10
 */
export interface Printer {

  addAdapter(adapter: LogAdapter): void

  clearAdapters(): void

  d(tag: string | null, message: string): void

  i(tag: string | null, message: string): void

  w(tag: string | null, message: string): void

  e(tag: string | null, message: string): void

  log(priority: number, tag: string | null, message: string): void
}