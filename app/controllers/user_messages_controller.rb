class UserMessagesController < ApplicationController
	def new
		@context = context
    @message = @context.user_messages.build(user: current_user)
	end
	
		
	def show
		@message = UserMessage.find(params[:id])
	end
	
	def index
		@context = context
		@mesages = @context.user_messages
	end
	
	def destroy
		@message = UserMessage.find(params[:id])
		return_path = message_owner_url(@message)
		@message.destroy
		redirect_to return_path
		
	end
	
	def edit
		@message = UserMessage.find(params[:id])
	end
	
	def update
		@message = UserMessage.find(params[:id])

		if @message.update_attributes(message_params)
			redirect_to message_owner_url(@message)
		else
			render 'edit'
		end
	end
	
	
	def create
		@context = context
    @message = @context.user_messages.build(message_params)
    @message.user=current_user
    
		
    if @message.save
      redirect_to context_url(context), notice: "Сообщение добавлено"
    else
     render 'new'
    end
		
		
	end
	
	private
		def message_params
			params.require(:user_message).permit(:subject,:body)
		end
		
	 def context
  	if params[:vm_id]
    	id = params[:vm_id]
    	Vm.find(params[:vm_id])
    else
      id = params[:hardware_id]
      Hardware.find(params[:hardware_id])
    end
  end
  
  def message_owner_url(msg)
  	if msg.commentable_type=="Vm"
				vm_path(Vm.find(msg.commentable_id))
			else
				hardware_path(Hardware.find(msg.commentable_id))
			end
	end
  
  def context_url(context)
    if Vm === context
      vm_path(context)
    else
      hardware_path(context)
    end
  end

end
