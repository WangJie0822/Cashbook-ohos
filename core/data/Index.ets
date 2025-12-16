import { settings } from '@kit.BasicServicesKit';
import { SettingsRepositoryImpl } from './src/main/ets/repository/impl/SettingsRepositoryImpl';

export { SettingsRepository } from './src/main/ets/repository/SettingsRepository';

export { SettingsRepositoryImpl } from './src/main/ets/repository/impl/SettingsRepositoryImpl';

export const settingsRepository = new SettingsRepositoryImpl();