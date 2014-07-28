module HomeHelper
  def fake_image
    x = Random.rand(400..600)
    y = Random.rand(400..600)
    "http://lorempixel.com/#{x}/#{y}/"
  end

  def fake_title
    Faker::Company.name
  end

  def fake_content
    Faker::Lorem.paragraph
  end

  def fake_category
    Faker::Lorem.words(3..4)
  end
end
