class AddColumnsToDeveloper < ActiveRecord::Migration
  def change
    add_column :developers, :name, :string
    add_column :developers, :password, :string
    add_column :developers, :image, :string
    add_column :developers, :github_url, :string
    add_column :developers, :blog_url, :text, array: true, default: []
    add_column :developers, :company, :string
    add_column :developers, :location, :string
    add_column :developers, :bio, :text
    add_column :developers, :hireable, :boolean
    add_column :developers, :provider, :string
    add_column :developers, :uid, :string
  end
end
