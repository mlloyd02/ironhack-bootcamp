class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships

	def valence_avg days
		emotions = users.map { |user| user.emotions.limit(days) }
		valence = emotions.map { |emotion| emotion.pluck(:valence).reverse}
		valence_avg = valence.transpose.map { |a| a.reduce(:+)/valence.length}
	end

	def arousal_avg days
		emotions = users.map { |user| user.emotions.limit(days) }
		arousal = emotions.map { |emotion| emotion.pluck(:arousal).reverse}
		arousal_avg = arousal.transpose.map { |a| a.reduce(:+)/arousal.length}
	end

	def format_days days
		emotions = users.map { |user| user.emotions.limit(days) }
		days = emotions[0].map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}
		days = days.reverse
	end

	def valences_avg days
		val_array = valence_avg(days)
		val_avg = val_array.reduce(:+)/val_array.length
	end

	def arousals_avg days
		arous_array = arousal_avg(days)
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
