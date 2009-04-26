class Eye
  def initialize
    @eye = Hash.new(0)
  end
  
  def see(obj)
    true if @eye[obj] += 1
  end
  
  def seen?(obj)
    @eye.key? obj
  end
end  
