class Player < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :game_players
  has_many :games, through: :game_players
  after_initialize :init

  def init
    self.wins ||= 0
    self.losses ||=0
  end   
end
