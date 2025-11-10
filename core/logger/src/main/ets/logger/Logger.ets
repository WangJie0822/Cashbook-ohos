import { LogAdapter } from './LogAdapter';
import { LoggerPrinter } from './LoggerPrinter';
import { Printer } from './Printer';

/**
 * 日志打印工具
 *
 * @author <a href="mailto:15555650921@163.com">王杰</a> 创建于 2025/11/10
 */
export class Logger {
  public static DEBUG = 3;
  public static INFO = 4;
  public static WARN = 5;
  public static ERROR = 6;
  private static printer: Printer | null = new LoggerPrinter();

  private constructor() {
  }

  public static setPrinter(printer: Printer) {
    Logger.printer = printer;
  }

  public static addAdapter(adapter: LogAdapter) {
    Logger.printer?.addAdapter(adapter);
  }

  public static clearAdapter() {
    Logger.printer?.clearAdapters();
  }

  public static d(tag: string | null, message: string) {
    Logger.printer?.d(tag, message);
  }

  public static i(tag: string | null, message: string) {
    Logger.printer?.i(tag, message);
  }

  public static w(tag: string | null, message: string) {
    Logger.printer?.w(tag, message);
  }

  public static e(tag: string | null, message: string) {
    Logger.printer?.e(tag, message);
  }

  public static log(priority: number, tag: string | null, message: string) {
    Logger.printer?.log(priority, tag, message);
  }
}