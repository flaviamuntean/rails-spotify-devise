class Video < ApplicationRecord
  validates_uniqueness_of :uid, scope: :user_id
  # validates :uid, presence: true
  validates :user, presence: true
  belongs_to :user
  validates :uid, length: { is: 11 }

  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  validates :link, presence: true, format: YT_LINK_FORMAT

  # before_create do
  #   uid = link.match(YT_LINK_FORMAT)
  #   self.uid = uid[2] if uid && uid[2]

  #   if self.uid.to_s.length != 11
  #     self.errors.add(:link, 'is invalid.')
  #     false
  #   elsif Video.where(["uid = ? and user_id = ?", self.uid, self.user.id]).any?
  #     self.errors.add(:link, 'is not unique.')
  #     false
  #   end
  # end

  before_validation do
    uid = link.match(YT_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]
  end
end
