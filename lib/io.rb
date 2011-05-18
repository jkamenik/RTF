require 'stringio'

module Io
  def capture(&block)
    begin
      out = $stdout
      err = $stderr
      $stdout = StringIO.new
      $stderr = StringIO.new
      status = yield
      output = $stdout.string
      error  = $stderr.string
    ensure
      $stdout = out
      $stderr = err
    end
    
    [status,output,error]
  end
  
  module_function :capture
end