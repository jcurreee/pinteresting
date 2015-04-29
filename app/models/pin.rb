class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :image, presence: true
	validates :description, presence: true

	def next
  	self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
