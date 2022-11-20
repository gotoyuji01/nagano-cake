# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin
Admin.create!(:email => 'abc@jp.com', :password => 'abcdefgh')

# customer
#Customer.create!(:customer_id => '1', :email => '111@yahoo.co.jp', :password => 'bbbbbb', :first_name => "山田", :last_name => "花子", :first_name_kana => "ヤマダ", :last_name_kana => "ハナコ", :phone_number => "11111111111", :postal_code => "1111111", :street_address => "東京都渋谷区道玄坂3-3-3")

