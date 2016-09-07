"" add "&" selector from cssnext
syn keyword cssTagName &

"" allow nesting selectors
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=cssAttrRegion,css.*Prop,cssComment,cssValue,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssTagName,cssSelectorOp,cssSelectorOp2,cssAttributeSelector,cssClassName,cssIdentifier,cssDefinition,cssHacks,cssNoise fold
