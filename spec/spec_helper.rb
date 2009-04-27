require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'eye'

module HelperMethods
  TYPES = [:bloom_filter, :array, :hash]
  def eyes
    TYPES.map{|t| Eye.new(:type => t)}
  end      
end

Spec::Runner.configure do |config|
  
end
