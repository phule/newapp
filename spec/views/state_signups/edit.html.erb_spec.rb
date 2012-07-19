require 'spec_helper'

describe "state_signups/edit" do
  before(:each) do
    @state_signup = assign(:state_signup, stub_model(StateSignup,
      :email => "MyString",
      :active => 1
    ))
  end

  it "renders the edit state_signup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => state_signups_path(@state_signup), :method => "post" do
      assert_select "input#state_signup_email", :name => "state_signup[email]"
      assert_select "input#state_signup_active", :name => "state_signup[active]"
    end
  end
end
