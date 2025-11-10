/**
 * 日志打印适配器
 *
 * @author <a href="mailto:15555650921@163.com">王杰</a> 创建于 2025/11/10
 */
export interface LogAdapter {

  /**
   * 获取最终 tag
   * @param tag 传递的 tag
   * @returns 最终打印的非空 tag
   */
  getTag(tag: string | null): string

  /**
   * 是否可以打印
   * @param priority 日志等级
   * @param tag 日志标签
   * @returns 是否允许打印
   */
  isLoggable(priority: number, tag: string | null): boolean

  /**
   * 打印日志
   * @param priority 日志等级
   * @param tag 日志标签
   * @param message 日志内容
   */
  log(priority: number, tag: string | null, message: string): void
}