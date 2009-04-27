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
    @eye = self.class.const_get( @type.to_s.capitalize ).new
  end
  
  def method_missing(method, *args)
    @eye.send(method,*args)
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

end
