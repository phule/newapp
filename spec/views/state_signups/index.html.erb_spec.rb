require 'spec_helper'

describe "state_signups/index" do
  before(:each) do
    assign(:state_signups, [
      stub_model(StateSignup,
        :email => "Email",
        :active => 1
      ),
      stub_model(StateSignup,
        :email => "Email",
        :active => 1
      )
    ])
  end

  it "renders a list of state_signups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
