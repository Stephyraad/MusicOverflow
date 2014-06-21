require 'spec_helper'

describe Comment do
  before {@comment= Comment.create(text_comment: 'https://soundcloud.com/simonpatterson/simon-patterson-open-up-072-kane-michael-guest-mix')}
  subject{@comment}
  
  describe ":text_comment" do
  	it "should not be an empty string"do
 		expect(@comment.text_comment).to_not eq " "
  	end
  end
end


