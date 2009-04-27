class Eye
  DEFAULT_TYPE = :hash
  attr_reader :type, :eye
  def initialize(args={})
    unless args.empty?
      raise ArgumentError unless Hash === args
      raise ArgumentError if args.keys.size != 1 || args.keys.first != :type
      raise ArgumentError unless Symbol === args.values.first
    end       
    @type = args.key?(:type) ? args[:type] : DEFAULT_TYPE
    @eye = Hash.new(0)
  end
  
  def see(obj)
    true if @eye[obj] += 1
  end
  
  def seen?(obj)
    @eye.key? obj
  end
end  
