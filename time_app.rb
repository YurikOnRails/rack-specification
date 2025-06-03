class TimeApp
  VALID_FORMATS = %w[year month day hour minute second].freeze

  def call(env)
    request = Rack::Request.new(env)
    
    return not_found unless request.path == '/time' && request.get?
    
    format_param = request.params['format']
    return bad_request('Unknown time format []') if format_param.nil?

    formats = format_param.split(',')
    unknown_formats = formats - VALID_FORMATS
    
    return bad_request("Unknown time format [#{unknown_formats.join(', ')}]") if unknown_formats.any?

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

    [200, { 'Content-Type' => 'text/plain' }, [result]]
  end

  private

  def not_found
    [404, { 'Content-Type' => 'text/plain' }, []]
  end

  def bad_request(message)
    [400, { 'Content-Type' => 'text/plain' }, [message]]
  end
end 
