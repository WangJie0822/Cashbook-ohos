import { TextStyleModifier } from './src/main/ets/style/Styles';

export { UIConstants } from './src/main/ets/constants/Constants';

export { StorageKey } from './src/main/ets/enums/Enums';

export { RouterParam, IPageContext, PageContext } from './src/main/ets/router/PageContext';

export { BaseViewModel, BaseState, BaseEvent } from './src/main/ets/base/ViewModel';

export { default as Toast } from './src/main/ets/component/Toast';

export const titleTextModifier = new TextStyleModifier(24, FontWeight.Bold)

export const bodyTextModifier = new TextStyleModifier(16, FontWeight.Normal)