class UserMailer < ApplicationMailer

	def welcome
		@user = params[:user]
		@new_password = params[:new_password]

		mail(to: @user.email, subject: "Welcome " + @user.full_name)
	end
end
