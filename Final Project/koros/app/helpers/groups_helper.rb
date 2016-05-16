module GroupsHelper
	def group_member?(group_id, user_id)
		Membership.where(group_id: group_id, user_id: user_id).present?
	end
end
