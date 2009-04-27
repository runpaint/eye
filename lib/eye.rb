class Eye
  DEFAULT_TYPE = :hash
  attr_reader :type
  def initialize(args={})
    unless args.empty?
      raise ArgumentError unless ::Hash === args
      raise ArgumentError if args.keys.size != 1 || args.keys.first != :type
      raise ArgumentError unless Symbol === args.values.first
    end       
    @type = args.key?(:type) ? args[:type] : DEFAULT_TYPE
    begin
      @eye = self.class.const_get( @type.to_s.gsub(/(^|_)(.)/){$2.upcase} ).new
    rescue NameError
      raise ArgumentError, "#{@type} is an invalid type"
    end  
  end
  
  def method_missing(method, *args)
    return @eye.send(method,*args)
  end  
  class Hash
    attr_reader :eye
    def initialize
      @eye = ::Hash.new(0)
    end
    def see(obj)
      true if @eye[obj] += 1
    end
    
    def seen?(obj)
      @eye.key? obj
    end
  end  

  class Array
    attr_reader :eye
    def initialize
      @eye = ::Array.new
    end
    def see(obj)
      true if @eye << obj
    end
    
    def seen?(obj)
      @eye.include? obj
    end
  end  

  class BloomFilter
    require 'bloomfilter'
    attr_reader :eye
    def initialize
      @eye = ::BloomFilter.new(100)
    end
    def see(obj)
      true if @eye.add obj.to_s
    end
    
    def seen?(obj)
      @eye.include? obj.to_s
    end
  end  
end
