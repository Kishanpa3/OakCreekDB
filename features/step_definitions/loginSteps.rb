require './features/support/helpers'

Given("the following User table") do |table|
  for row in table.rows do
    User.create!(first_name: row[0], last_name: row[1], email: row[2], password: row[3],  confirmed_at: row[4], approved: row[5])
  end
end

Given("I am on the User login page") do
  visit '/users/sign_in'
  wait_for_ajax
end

Given("I am signed out") do
  visit animals_path
  wait_for_ajax
  if has_link? 'Logout'
    click_link 'Logout'
    # puts 'Logged Out!'
  end
end

Given("I have registered a user with the credentials {string} {string} {string} {string}") do |_first, _last, _email, _password|
  visit new_user_registration_path
  fill_in "First name", :with => _first
  fill_in "Last name", :with => _last
  fill_in "Email", :with => _email
  fill_in "Password", :with => _password
  fill_in "Password confirmation", :with => _password
  
  click_button "Sign up"
  
  # Confirm the user once they are in the database
  @user = User.find_by(email: _email)
  @user.confirmed_at = "2019-11-12 18:25:34"
  @user.approved = true
  @user.save
end

Given("I sign in as an {string} with the email {string} and the password {string}") do |_role, _email, _password|
  if _role === "Admin"
    @user = User.find_by(email: _email)
    expect(@user).to be_truthy #not nil check
    @user.admin = true
    @user.save
  end

  fill_in "Email", :with => _email
  fill_in "Password", :with => _password
  
  click_button "Log in"
  page.should have_content "All Animals"
end
