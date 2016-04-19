require 'rails_helper'

feature 'Posts' do
  context 'no posts have been added & initialize with no images' do
    scenario 'should display a prompt to add an image' do
      visit posts_path
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end
end
