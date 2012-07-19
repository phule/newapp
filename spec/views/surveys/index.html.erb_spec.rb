require 'spec_helper'

describe "surveys/index" do
  before(:each) do
    assign(:surveys, [
      stub_model(Survey,
        :num_question => "",
        :responses => "",
        :percent_responses => "",
        :vs_other_companies => "Vs Other Companies",
        :add_note => "Add Note"
      ),
      stub_model(Survey,
        :num_question => "",
        :responses => "",
        :percent_responses => "",
        :vs_other_companies => "Vs Other Companies",
        :add_note => "Add Note"
      )
    ])
  end

  it "renders a list of surveys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Vs Other Companies".to_s, :count => 2
    assert_select "tr>td", :text => "Add Note".to_s, :count => 2
  end
end
