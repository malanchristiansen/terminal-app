require 'colorize'
require 'sleep2'
require 'tty-box'
require 'terminal-table'

class CustomerOrder
    attr_reader :bill, :name  
    def initialize(name)
        @name = name 
        @bill = 0 
    end 
    def welcome_msg
        puts "Choose a delicious beer from the menu or exit the menu".colorize(:yellow)
    end 
    def menu 
        menu_items = {"1. Bentspoke's Crankshaft IPA" => 12, "2. Young Henry's New Towner Australian Pale Ale" => 8, "3. Philter Brewing's Red Session Ale" => 10}
        # update the menu list (contains item number and price) with the right price if the menu items are updated otherwise CODE WILL NOT WORK
        @menu_list = {1 => 12, 2 => 8, 3 => 10}
        menu_items.each do |item, price|
            puts "#{item}: $#{price}"
        end 
    end 
    def get_item_price(user_choice)
        @item_price = @menu_list[user_choice]
    end 

    def get_quantity
        puts "How many would you like?".colorize(:blue)
        @quantity = gets.chomp.to_i
    end 

    def calculate_bill
        @bill += @item_price * @quantity
    end 

    def place_order(user_choice)
        get_item_price(user_choice)
        get_quantity
        calculate_bill
        puts "Here is your bill: $#{@bill}".colorize(:yellow)
        sleep(2)
        puts "Enjoy your beer!".colorize(:blue)
    end 
end 
