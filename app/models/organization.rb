class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :developers, :through => :projects

  validates_presence_of :name, :description, :url
  mount_uploader :avatar, AvatarUploader
end
