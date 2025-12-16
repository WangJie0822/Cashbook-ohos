import { preferences } from "@kit.ArkData";
import { appManager } from "common";
import { Logger } from "logger";

const TAG = "AppPreference"

export class AppPreference {
  private KEY_PRIVACY_AGREEMENT_ACCEPTED = "KEY_PRIVACY_AGREEMENT_ACCEPTED"
  private declare preference: preferences.Preferences

  constructor() {
    let option: preferences.Options = { name: "AppPreference" };
    try {
      this.preference = preferences.getPreferencesSync(appManager.getContext(), option);
    } catch (err) {
      Logger.w(TAG, "")
    }
  }

  isPrivacyAgreementAccepted(): boolean {
    try {
      let value = this.preference.getSync(this.KEY_PRIVACY_AGREEMENT_ACCEPTED, false);
      return typeof value === 'boolean' ? value : false;
    } catch (err) {
      Logger.w("isPrivacyAgreementAccepted:", err);
      return false;
    }
  }

  setPrivacyAgreementAccepted(accepted: boolean): void {
    try {
      this.preference.putSync(this.KEY_PRIVACY_AGREEMENT_ACCEPTED, accepted)
      this.preference.flushSync()
    } catch (err) {
      Logger.w("setPrivacyAgreementAccepted:", err);
    }
  }
}