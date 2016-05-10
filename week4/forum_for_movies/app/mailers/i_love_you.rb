class ILoveYou < ApplicationMailer

	def send_message
		mail(to: "mlloyd02@gmail.com", subject: "A little message to brighten your day!")
	end

	def monthly_newsletter
		User.all.each do |user|
			@user = user 
		end
	end

end
