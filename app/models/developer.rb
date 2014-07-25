class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :validatable
  devise :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:github]

  def self.from_omniauth(auth)

    where(auth.slice(:uid, :provider)).first_or_create do |dev|
      dev.handle_omni_assignment(auth)
    end
  end



  private

    def handle_omni_assignment auth_hash
      attrs = {name: auth.info.name,
            image: auth.info.image,
            email: auth.info.email,
            github_url: auth.info.urls.github,
            blog_url: [auth.info.urls.blog, auth.extra.raw_info.blog],
            company: auth.extra.raw_info.company,
            location: auth.extra.raw_info.location,
            bio: auth.extra.raw_info.bio,
            hireable: auth.extra.raw_info.hireable}
      attrs.each do |attr, val|
        case val
        when String
          dev.send "#{attr}=", val unless val.empty?
        when Array
            valid_blogs = val.select { |blog|  blog && !blog.empty? }
            dev.send(attr).concat( valid_blogs )
        else
          dev.send "#{attr}=", val if val
        end
      end
    end
end
    #   dev.name = auth.info.name
    #   dev.password = Devise.friendly_token[0,20]
    #   dev.image = auth.info.image
    #   dev.github_url = auth.info.urls.github
    #   dev.blog_url << auth.info.urls.blog << auth.extra.raw_info.blog
    #   dev.company = auth.extra.raw_info.company
    #   dev.location = auth.extra.raw_info.location
    #   dev.bio = auth.extra.raw_info.bio
    #   dev.hireable = auth.extra.raw_info.hireable
    #   dev.email = auth.info.email

# image =
#  =
# blog_url << auth.info.urls.blog << auth.extra.raw_info.blog
# company = auth.extra.raw_info.company
# location = auth.extra.raw_info.location
# bio = auth.extra.raw_info.bio
# hireable = auth.extra.raw_info.hireable
# email = auth.
