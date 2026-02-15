require 'rails_helper'

RSpec.describe "families/edit", type: :view do
  let(:family) {
    Family.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:family, family)
  end

  it "renders the edit family form" do
    render

    assert_select "form[action=?][method=?]", family_path(family), "post" do
      assert_select "input[name=?]", "family[name]"
    end
  end
end
