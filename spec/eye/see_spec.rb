describe "Eye.see" do
  include HelperMethods

  it "is a method" do
    eyes.each do |eye|
      eye.should.respond_to? :see
    end  
  end
 
  it "takes a single argument" do
    eyes.each do |eye|
      lambda{eye.see("string")}.should_not raise_error
    end  
  end

  it "raises an ArgumentError if called without arguments" do
    eyes.each do |eye|
      lambda{eye.see}.should raise_error(ArgumentError)
    end  
  end
  
  it "raises an ArgumentError if called with more than one argument" do
    eyes.each do |eye|
      lambda{eye.see(1,2)}.should raise_error(ArgumentError)
      lambda{eye.see("string",['glark'],"bar")}.should raise_error(ArgumentError)
    end
  end
  
  it "returns true if the object was recorded" do
    eyes.each do |eye|
      ['Kim', 'http://example.com/'].each do |obj|
        eye.see(obj).should == true
      end
    end  
  end

end

