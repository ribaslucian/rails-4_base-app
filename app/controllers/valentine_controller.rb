class ValentineController < ApplicationController

	self.layout 'no_menu'

	skip_before_filter :authenticate_user!, only: [:new, :calc]

	def new

	end

	def calc
		now = DateTime.now
		date = DateTime.iso8601 params[:date][:valentines_day]

		diff = now - date

		render plain: diff.to_f
	end

end
