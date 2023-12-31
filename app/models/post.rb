class Post < ApplicationRecord
#  extend NewsSharerCustomFeedGem::PostOrdering
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :url, presence: true
  validates :category_id, presence: true

  before_save :set_default_values

  acts_as_votable
  private
  def set_default_values
    self.upvotes ||= 0
    self.downvotes ||= 0
    self.cached_votes_total ||= 0
    self.cached_votes_score ||= 0
    self.cached_votes_up ||= 0
    self.cached_votes_down ||= 0
  end
end





