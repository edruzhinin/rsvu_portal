class GroupRelationsController < ApplicationController
	def new
  	@context = context
    @group_relation = @context.group_relations.new
  end
  
  def create
  	@context = context
    @group_relation = @context.group_relations.build(grouprelation_params)
		
    if @group_relation.save
  		flash[:success]= "Группа добавлена"
  		redirect_to context_url(context)
    else
     render 'new'
    end
	end
	
	def destroy
		@grouprelation = GroupRelation.find(params[:id])
		
		if @grouprelation.groupable_type == "Vm"
			return_path = vm_path(Vm.find(@grouprelation.groupable_id))
		else
			return_path = hardware_path(Hardware.find(@grouprelation.groupable_id))
		end
		@grouprelation.destroy
    flash[:danger]=  "Группа удалена"		
		redirect_to return_path
		
	end
	
#  
#	def update
#    @context = context
#    @reservation = @context.reservations.find(params[:id])
#    if @interaction.update_attributes(reservation_params)
#      redirect_to context_url(context), notice: "The interaction has been updated"
#    end
#  end
  
  
  private
  def grouprelation_params
    params.require(:group_relation).permit(:group_id)
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
  
  def context_url(context)
    if Vm === context
      vm_path(context)
    else
      hardware_path(context)
    end
  end

  
  	
	
end
