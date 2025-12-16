export class TextStyleModifier implements AttributeModifier<TextAttribute> {
  private fontSize: number
  private fontWeight: FontWeight

  constructor(fontSize: number, fontWeight: FontWeight) {
    this.fontSize = fontSize
    this.fontWeight = fontWeight
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.fontSize(this.fontSize).fontWeight(this.fontWeight)
  }
}