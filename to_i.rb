class ToI
  CHARACTER_TO_INTEGER_MAPPING = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
  }
  def self.parse value
    return 0 if value.nil? || value == ''

    interim_value = value.gsub('__', 'a').gsub('_', '')
    parsed_value = ''

    if interim_value[0] == '-'
      negative_value = true
      interim_value = interim_value [1..-1]
    end

    interim_value.each_char.each do |character|
      break unless CHARACTER_TO_INTEGER_MAPPING.include? character
      parsed_value += character
    end

    if negative_value
      -convert_to_integer(parsed_value)
    else
      convert_to_integer parsed_value
    end
  end

  def self.convert_to_integer value
    integer = 0

    value.reverse.each_char.each_with_index do |character, index|
      number = CHARACTER_TO_INTEGER_MAPPING[character]
      return integer if number.nil?

      if index == 0
        integer += number
      else
        integer += number * (10**index)
      end
    end

    integer
  end
end
