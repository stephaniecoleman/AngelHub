class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :validatable
  devise :registerable, :recoverable, :rememberable, 
         :trackable, :validatable, :omniauthable, 
         :omniauth_providers => [:github]
end
