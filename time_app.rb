require_relative 'time_formatter'

class TimeApp
  def call(env)
    request = Rack::Request.new(env)
    
    return method_not_allowed unless request.get?

    handle_request(request)
  end

  private

  def handle_request(request)
    result = TimeFormatter.call(request.params['format'])

    if result[:success]
      [200, {}, [result[:result]]]
    else
      [400, {}, [result[:error]]]
    end
  end

  def method_not_allowed
    [405, {}, ['Method Not Allowed']]
  end
end
