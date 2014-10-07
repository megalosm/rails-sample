When(/^I access to "([^"]*)"$/) do |arg|
  visit arg
end

Then(/^I should can see "([^"]*)"$/) do |arg|
  expect(page).to have_content(arg)
end

When(/^I sign in to app$/) do
  @current_user = FactoryGirl.create(:user)
  fill_in 'Email', :with => @current_user.email
  fill_in 'Password', :with => @current_user.password
  click_button 'Sign in'
end

Given(/^I am not sign in to app$/) do
  expect(@current_user).to be_nil
end

And(/^I click "([^"]*)"$/) do |arg|
  click_link_or_button arg
end