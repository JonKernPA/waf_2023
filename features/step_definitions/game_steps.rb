Given(/^The application is configured$/) do
  @app = AppleSauce.new
end

When(/^The Start button is pressed$/) do
  @app.start
end

Then(/^The Game will Start$/) do
  expect(@app.started).to be_truthy
end

Then(/^The Start button will = Stop$/) do
  pending
end

And(/^the application is started$/) do
  @app.start
end

When(/^The Stop button is pressed$/) do
  @app.stop
end

Then(/^The Game will be stopped$/) do
  expect(@app.started).to be_falsey
end
