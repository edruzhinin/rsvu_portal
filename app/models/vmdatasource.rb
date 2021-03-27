class Vmdatasource < ActiveRecord::Base
  belongs_to :vmhost
  
  def Vmdatasource.readable_size(_size)
		if (_size > 1024*1024)
			return '%-3.3f Тб' % (_size/1024.0/1024.0)
		else
			if (_size > 1024)
				return '%-3.f Гб' % (_size/1024.0)
			else
				return '%d Мб' % _size
			end
		end
	end
  
  def over_provisioned
  	if (ds_uncommited > ds_freespace)
  		return ds_uncommited - ds_freespace
  	else
  		return 0
  	end
	end
  
  def free_percent
  	if (ds_capacity > 0)
  		return ds_freespace*100 / ds_capacity
  	else
  		return 0
  	end
	end
	 def overp_percent
  	if (ds_capacity > 0)
  		return over_provisioned*100 / ds_capacity
  	else
  		return 0
  	end
	end
end
