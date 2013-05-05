=begin
Given /^there is only (\d+) products$/ do |products|
  Product.delete_all
  (0..products.to_i-1).each do |i|

    s=Product.new(:name=>"TESTING"+i.to_s)
    s.save
  end
end

Given /^Im on products page$/ do
  visit('/products')
end

Given /^Im on the first product page$/ do
  visit('/products/1')
end

Given /^there should be only 1 product$/ do

  products = Product.all
  if(products.count == 1)
    true
  end
end

When /^I click on delete$/ do
  click_link("Delete")
end
=end

Given /^there are 1 or more products$/ do
  visit('/products')

end

Given /^Im on products page$/ do
  visit '/products'
end

