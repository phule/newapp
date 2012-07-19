user_idrequire 'spec_helper'

describe "receivers/edit" do
  before(:each) do
    @receiver = assign(:receiver, stub_model(Receiver,
      :name => "MyString",
      :email => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit receiver form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => receivers_path(@receiver), :method => "post" do
      assert_select "input#receiver_name", :name => "receiver[name]"
      assert_select "input#receiver_email", :name => "receiver[email]"
      assert_select "input#receiver_user_id", :name => "receiver[user_id]"
    end
  end
end
