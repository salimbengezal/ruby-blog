require 'rails_helper'

RSpec.describe Comment, type: :model do
	
	it "creates comment with 'sometext' " do
		@article = Article.create
		@comment = @article.comments.build(body: "sometext")
		expect(@comment.body).to eq ("sometext")
	end

	

end