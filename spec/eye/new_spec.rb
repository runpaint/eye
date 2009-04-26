describe "Eye.new" do
  
  it "initialises without arguments" do
    lambda{eye = Eye.new}.should_not raise_error
  end
  
  it "creates an instance of Eye" do
    eye = Eye.new
    eye.class.should == Eye
    eye.should.is_a?(Eye)
  end

end
