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

	def valences_avg days
		val_array = valences(days)
		val_avg = val_array.reduce(:+)/val_array.length
	end

	def arousals_avg days
		arous_array = arousals(days)
		arous_avg = arous_array.reduce(:+)/arous_array.length
	end

	def dial_angle days
		arous = arousals_avg(days)
		val = valences_avg(days)
		angle = Math.atan2((arous), (val))
	end

	def intensity days
		arous = arousals_avg(days)
		val = valences_avg(days)
		intensity = Math.sqrt((val)**2 + (arous)**2)
	end

end
