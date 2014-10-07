Then(/^I should can sign in to app$/) do
  expect(page).to have_content(@current_user.name)
end

When(/^I sign out from app$/) do
  click_link 'Sign out'
end

Then(/^I should can sign out from app$/) do
  expect(page).not_to have_content(@current_user.name)
  expect(page).to have_content('Sign in')
end

When(/^I register to app$/) do
  click_link 'Register Account'

  @current_user = User.new(
      :email => Faker::Internet.email,
      :password => Faker::Internet.password,
      :name => Faker::Internet.user_name
  )

  fill_in 'Email', :with => @current_user.email
  fill_in 'Password', :with => @current_user.password
  fill_in 'Confirm Password', :with => @current_user.password
  fill_in 'Display Name', :with => @current_user.name

  click_button 'Register'
end

When(/^I click my user name$/) do
  find('#user_display_name').click
end

Then(/^I should can see user panel$/) do
  expect(page).to have_selector('#user_info_panel', :visible => true)
end

When(/^I edit new user info$/) do
  click_link "Edit"

  @current_user.name = Faker::Internet.user_name
  @current_user.email = Faker::Internet.email

  fill_in 'Display Name', :with => @current_user.name
  fill_in 'Email', :with => @current_user.email
  fill_in 'Current Password', :with => @current_user.password
  click_button 'Update'
end

Then(/^I should can my user current info$/) do
  expect(page).to have_content(@current_user.email)
  expect(page).to have_content(@current_user.name)
end