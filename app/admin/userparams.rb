ActiveAdmin.register Userparam do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

form do |f|
  f.actions
	f.inputs 'Profile' do	    
	    f.input :user_id, :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
	    f.input :firstname
	    f.input :lastname
	    f.input :age
	    f.file_field :avatar
	end
  f.actions
end

permit_params :user_id, :firstname, :lastname, :age, :avatar
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
