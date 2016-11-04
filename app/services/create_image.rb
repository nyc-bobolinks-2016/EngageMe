class CreateImage
  def initialize(image:)
    @image = image
  end

  def call
    File.open('./public/snapshot.jpg', 'wb') do |f|
      f.write(Base64.decode64(@image))
    end
  end
end
