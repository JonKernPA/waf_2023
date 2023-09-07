Given(/^I have a calculator$/) do
  @calculator = Calculator.new
end

When(/^I add two numbers (.*) and (.*)$/) do |a, b|
  @result = @calculator.add(a.to_i, b.to_i)
end

Then(/^I should see (.*)$/) do |x|
  expect(@result).to eql(x.to_i)
end

