class Developer < ActiveRecord::Base
  has_many :developer_projects
  has_many :projects, :through => :developer_projects
  has_many :organizations, :through => :projects
  validates_presence_of :name, :github_url
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :validatable
  devise :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:github]


  def self.from_omniauth(auth)
    where(auth.slice(:uid, :provider)).first_or_create do |developer|
      developer.handle_omni_assignment(auth)
    end
  end


  def handle_omni_assignment auth
    attrs = {
      name: auth.info.name,
      image: auth.info.image,
      email: auth.info.email,
      github_url: auth.extra.raw_info.html_url,
      blog_url: [auth.info.urls.blog, auth.extra.raw_info.blog],
      company: auth.extra.raw_info.company,
      location: auth.extra.raw_info.location,
      bio: auth.extra.raw_info.bio,
      hireable: auth.extra.raw_info.hireable,
      password: Devise.friendly_token[0, 20]
    }

    attrs.reject! do |_, val|
      if val.is_a? Array
          val.reject!(&:blank?).none?
      else
        val.blank?
      end
    end
    assign_attributes( attrs )
  end

end
