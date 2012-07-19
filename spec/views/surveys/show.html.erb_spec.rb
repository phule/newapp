require 'spec_helper'

describe "surveys/show" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :num_question => "",
      :responses => "",
      :percent_responses => "",
      :vs_other_companies => "Vs Other Companies",
      :add_note => "Add Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Vs Other Companies/)
    rendered.should match(/Add Note/)
  end
end
