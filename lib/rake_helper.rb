require 'English'

ROOT_DIR = File.expand_path('../../', __FILE__)

def abort_on_failure(command, message = '')
  `#{command}`
  abort(message) unless $CHILD_STATUS.exitstatus.zero?
end
