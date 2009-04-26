describe "Eye.see" do

  before(:each) do
    @eye = Eye.new
  end

  it "is a method" do
    @eye.should.respond_to? :see
  end
 
  it "takes a single argument" do
    lambda{@eye.see("string")}.should_not raise_error
  end

  it "raises an ArgumentError if called without arguments" do
    lambda{@eye.see}.should raise_error(ArgumentError)
  end
  
  it "raises an ArgumentError if called with more than one argument" do
    lambda{@eye.see(1,2)}.should raise_error(ArgumentError)
    lambda{@eye.see("string",['glark'],"bar")}.should raise_error(ArgumentError)
  end
  
  it "returns true if the object was recorded" do
    ['Kim', 'http://example.com/'].each do |obj|
      @eye.see(obj).should == true
    end  
  end

end

