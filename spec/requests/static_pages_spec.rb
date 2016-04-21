
describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/articles'
      expect(page).to have_content('Listing')
    end
  end
end