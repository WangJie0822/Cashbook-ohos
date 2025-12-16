import { appPreference } from "dataPref";
import { SettingsRepository } from "../SettingsRepository";

export class SettingsRepositoryImpl implements SettingsRepository {
  isPrivacyAgreementAccepted(): boolean {
    return appPreference.isPrivacyAgreementAccepted()
  }

  setPrivacyAgreementAccepted(accepted: boolean): void {
    appPreference.setPrivacyAgreementAccepted(accepted)
  }
}