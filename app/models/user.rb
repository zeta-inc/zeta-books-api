class User < ActiveRecord::Base
  has_one :author
end
