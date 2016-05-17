class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships

	def valence_avg days
		emotions = self.users.map { |user| user.emotions.limit(days) }
		valence = emotions.map { |emotion| emotion.pluck(:valence).reverse}
		valence_avg = valence.transpose.map { |a| a.reduce(:+)/valence.length}
	end

	def arousal_avg days
		emotions = self.users.map { |user| user.emotions.limit(days) }
		arousal = emotions.map { |emotion| emotion.pluck(:arousal).reverse}
		arousal_avg = arousal.transpose.map { |a| a.reduce(:+)/arousal.length}
	end

	def format_days days
		emotions = self.users.map { |user| user.emotions.limit(days) }
		days = emotions[0].map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}
		days = days.reverse
	end

	def calc_dial_angle
	end

	def calc_intensity
	end

end
