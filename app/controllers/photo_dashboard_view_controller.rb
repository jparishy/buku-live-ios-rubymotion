class PhotoDashboardViewController < UIViewController

  def viewDidLoad
    super
    view.backgroundColor = UIColor.blueColor
    # photos_string = File.read("#{App.documents_path}/fan_photos.json")
    # @photos = BW::JSON.parse(photos_string)
  end

  # def load_images
  #   @photos.each do |photo|
  #     string = photo['fan_photo']['image']['my_picture']['url']
  #     urlString = NSURL.URLWithString(string)
  #     image_view = UIImageView.alloc.initWithFrame(view.bounds)
  #     image_view.setImageWithURL(urlString, placeholderImage: UIImage.imageNamed("photo-placeholder.png"))
  #     view.addSubview(image_view)
  #   end

  # end

end