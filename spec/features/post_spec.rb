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
    Post.create(title: 'Musafa')
  end

  scenario 'display title of image' do
    visit '/posts'
    expect(page).to have_content('Musafa')
    expect(page).not_to have_content('No posts yet')
  end
end
end
