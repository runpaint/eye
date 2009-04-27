describe "Eye given 1,000 integers" do
  include HelperMethods
  
  before(:all) do
    @numbers = (0..999).to_a
  end

  it "sees each number" do
    eyes.each do |eye|
      @numbers.each do |n|
        eye.see(n).should == true
      end
    end
  end

  it "reports each number seen after seeing them" do
    eyes.each do |eye|
      @numbers.each do |n|
        eye.see(n).should == true
        eye.seen?(n).should == true
      end
    end
  end

  it "reports each number seen after seeing them, regardless of order" do
    my_eyes = eyes
    my_eyes.each do |eye|
      @numbers.each do |n|
        eye.see(n).should == true
      end
    end
    my_eyes.each do |eye|
      @numbers.shuffle.each do |n|
        eye.seen?(n).should == true
      end
    end
  end
 
  it "reports unseen numbers as unseen" do
    my_eyes = eyes
    my_eyes.each do |eye|
      @numbers.each do |n|
        eye.see(n).should == true
      end
    end
    my_eyes.each do |eye|
      ('a'..'z').to_a.each do |l|
        eye.seen?(l).should == false
      end
    end  
  end

end

