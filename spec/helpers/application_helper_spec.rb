require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
describe ApplicationHelper do
  describe "textilize without paragraphs" do
    it "does as expected" do
      html_content = "<h1>Header Some content"
      helper.textilize_without_paragraph(html_content).should == html_content
    end
  end

  #describe "highlight search terms" do
  #  it "does as expected" do
  #    query = "foo"
  #    text = "babble babble foo babble"
  #    expected = "babble babble <span class='highlight'>#{query}</span> babble"
  #    helper.highlight_search_term(text, query).should == expected
  #  end
  #end
end
