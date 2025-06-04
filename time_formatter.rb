class TimeFormatter
  VALID_FORMATS = %w[year month day hour minute second].freeze

  def self.call(format_string)
    return { success: false, error: 'Unknown time format []' } if format_string.nil?

    formats = format_string.split(',')
    unknown_formats = formats - VALID_FORMATS

    if unknown_formats.any?
      return { success: false, error: "Unknown time format [#{unknown_formats.join(', ')}]" }
    end

    time = Time.now
    result = formats.map do |format|
      case format
      when 'year'   then time.strftime('%Y')
      when 'month'  then time.strftime('%m')
      when 'day'    then time.strftime('%d')
      when 'hour'   then time.strftime('%H')
      when 'minute' then time.strftime('%M')
      when 'second' then time.strftime('%S')
      end
    end.join('-')

    { success: true, result: result }
  end
end 
