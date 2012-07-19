require 'spec_helper'

describe "state_signups/show" do
  before(:each) do
    @state_signup = assign(:state_signup, stub_model(StateSignup,
      :email => "Email",
      :active => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/1/)
  end
end
