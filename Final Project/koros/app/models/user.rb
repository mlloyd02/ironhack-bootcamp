class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :emotions
  has_many :memberships
  has_many :groups, through: :memberships

  def valences days
		emotions = self.current_user.emotions.limit(days)
		valence = emotions.pluck(:valence).reverse
	end

	def arousals days
		emotions = self.current_user.emotions.limit(days)
		arousal = emotions.pluck(:arousal).reverse
	end

	def format_days days
		emotions = self.current_user.emotions.limit(days)
		days = emotions.map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}
		days = days.reverse
	end

end
