class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, :dependent => :destroy
  has_many :developers, :through => :projects

  validates_presence_of :name, :description, :url
  validates_uniqueness_of :name
  mount_uploader :avatar, AvatarUploader

  scope :featured, lambda { |limit = 4|
    all.shuffle.take(limit)
  }
end
