class VmsController < ApplicationController

	def show
		@vm = Vm.find(params[:id])
		
	end
end
