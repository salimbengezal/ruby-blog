require 'rails_helper'

RSpec.describe Article, type: :model do
	
	it "creates post with title 'Hello World'" do
		@article = Article.create(title: 'Hello World')
		expect(@article).to be
	end

end