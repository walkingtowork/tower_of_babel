class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_and_belongs_to_many :known_languages
  has_and_belongs_to_many :desired_languages
  has_many :messages

  attr_accessible :username, :email, :password, :password_confirmation, :known_language_ids, :desired_language_ids, :address, :latitude, :longitude, :image

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  mount_uploader :image, ImageUploader

  def received_messages
    Message.where(:receiver_id => self.id)
  end

  def sent_messages
    Message.where(:sender_id => self.id)
  end
end