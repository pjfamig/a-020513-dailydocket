class Post < ActiveRecord::Base
  attr_accessible :description, :title, :url, :user_id, :image_url
  belongs_to :users
  has_many :comments
  
  
  validates_length_of :title, :in => 3..150
  validates_length_of :description, :maximum => (64 * 1024)
  validates_presence_of :url, :title
  
  def domain
    if self.url.blank?
      nil
    else
      pu = URI.parse(self.url)
      pu.host.gsub(/^www\d*\./, "")
    end
  end
  
end
