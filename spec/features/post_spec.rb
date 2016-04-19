require 'rails_helper'

feature 'Posts' do
  context 'no posts have been added & initialize with no images' do
    scenario 'should display a prompt to add an image' do
      visit posts_path
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'posts have been added' do

    before do
      Post.create(title: 'Mufasa')
    end

    scenario 'display title of image' do
      visit '/posts'
      expect(page).to have_content('Mufasa')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'Creating a post' do
    scenario 'add a picture and title' do
      visit '/'
      click_link 'Add an image'
      attach_file('post[image]', Rails.root + "spec/files/images/Mufasa.jpg")
      fill_in 'Title', with: 'Mufasa'
      click_button 'Post'
      expect(page).to have_content('Mufasa')
      expect(page).to have_css("img[src*='Mufasa.jpg']")
    end
  end
end
