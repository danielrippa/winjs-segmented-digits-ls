
  do ->

    { string-from-code-point } = dependency 'native.String'
    { Num } = dependency 'primitive.Type'

    segmented-digit = -> string-from-code-point 0x1fbf0 + Num it

    digit-names = [ \0 to \9 ]

    is-digit = -> it in digit-names

    segmented-digits = { [ name, segmented-digit index ] for name, index in digit-names  }

    segmented-digit-or-char = (char) -> if is-digit char then segmented-digits[char] else char

    string-with-segmented-digits = (string) -> [ (segmented-digit-or-char char) for char in string / '' ] * ''

    {
      segmented-digit, segmented-digits,
      string-with-segmented-digits
    }