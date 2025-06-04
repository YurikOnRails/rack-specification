require_relative 'time_formatter'
require_relative 'time_app'

use Rack::ContentType, 'text/plain'

ROUTES = {
  '/time' => TimeApp.new
}

run Rack::URLMap.new(ROUTES)
