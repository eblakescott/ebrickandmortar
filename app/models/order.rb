class Order < ActiveRecord::Base
attr_accessible :name, :address, :email, :pay_type
end
