require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit blogs_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Blogs' do
      expect(page).to have_content(/Blogs/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      login_as(user, :scope => :user)
      visit new_blog_path
    end

    it 'nas a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'blog[title]', with: 'A title'
      fill_in 'blog[date]', with: Date.today
      fill_in 'blog[body]', with: "Some content"
      click_on 'Save'

      expect(page).to have_content("Some content")
    end

    it 'will have a user associated with it' do
      fill_in 'blog[title]', with: 'A title'
      fill_in 'blog[date]', with: Date.today
      fill_in 'blog[body]', with: "Some other content"

      click_on "Save"

      expect(User.last.blogs.last.body).to eq("Some other content")
    end
  end
end