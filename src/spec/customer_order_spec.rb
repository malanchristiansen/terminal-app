# Test cases:
# 1. test if the cutomer instance is created and if the customer has a readable name
# 2. should display a welcome msg
# 3. should be able to read the menu
# 4. should be able to recive user choice
# 5. should be able to get the item price
# 6. should be able to choose the quantity
# 7. should be able to retrieve the final bill

require_relative "../customer_order.rb"
require 'colorize'

describe CustomerOrder do 
    before(:each) do 
        @customer = CustomerOrder.new("John")
    end 
    it "instance must have a readable name" do 
        expect(@customer.name).to eq("John")
    end 
    it "displays welcome message" do 
        msg = "Choose a delicious beer from the menu or exit the menu".colorize(:yellow)
        expect(@customer.welcome_msg).to eq(msg)
    end 
    it "display the menu" do 
        menu = {"1. Bentspoke's Crankshaft IPA" => 12, "2. Young Henry's New Towner Australian Pale Ale" => 8, "3. Philter Brewing's Red Session Ale" => 10} 
        expect(@customer.menu).to eq(menu)
    end 
    it "get price on beer based on user choice" do 
        @customer.menu
        user_choice = 1 
        expect(@customer.get_item_price(user_choice)).to eq(12)
    end 
    it "should get the quantity" do 
        result = @customer.get_quantity
        p result 
        expect(@customer.get_quantity).to be > 0
    end 

    it "should calculate the final bill" do 
        @customer.menu
       user_choice = 1 
       final_bill = @customer.get_item_price(user_choice) * @customer.get_quantity
        expect(@customer.calculate_bill).to eq(final_bill)
    end 
end 


