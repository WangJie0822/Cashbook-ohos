/**
 * 设置相关数据仓库接口
 */
export interface SettingsRepository {

  /** 是否同意隐私协议 */
  isPrivacyAgreementAccepted(): boolean

  /** 设置是否同意隐私协议 */
  setPrivacyAgreementAccepted(accepted: boolean): void
}