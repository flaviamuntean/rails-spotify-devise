class Audio < ApplicationRecord
  validates :user, presence: true
  belongs_to :user
  validates :uid, presence: true, length: { is: 9 }
  validates_uniqueness_of :uid, scope: :user_id

  SC_LINK_FORMAT = /\A<iframe.+src=".+\/tracks\/(\d+)&.+<\/iframe>\z/i
  # validates :link, presence: true, format: SC_LINK_FORMAT

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
    uid = link.match(SC_LINK_FORMAT)
    self.uid = uid[1] if uid && uid[1]
  end
end
