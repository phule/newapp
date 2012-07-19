require 'spec_helper'

describe "receivers/show" do
  before(:each) do
    @receiver = assign(:receiver, stub_model(Receiver,
      :name => "Name",
      :email => "Email",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
  end
end
