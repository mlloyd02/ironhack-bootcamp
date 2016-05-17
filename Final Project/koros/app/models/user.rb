class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :emotions
  has_many :memberships
  has_many :groups, through: :memberships

  def valences days
		emotionz = emotions.limit(days)
		valence = emotionz.pluck(:valence).reverse
	end

	def arousals days
		emotionz = emotions.limit(days)
		arousal = emotionz.pluck(:arousal).reverse
	end

	def format_days days
		emotionz = emotions.limit(days)
		days = emotionz.map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}
		days = days.reverse
	end

end
