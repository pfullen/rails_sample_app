class UsersController < ApplicationController
  before_action :logged_in_user,
                only: [ :index, :edit, :update , :destroy,
                        :following, :followers]
  #before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:update, :edit , :destroy]

  def index
    @users = User.paginate(page: params[:page ], :per_page => 12)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page ], :per_page => 10)
  end

  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
   end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
   end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,
         :first_name, :last_name,     :middle_name, :date_of_birth,  :street_address, 
         :city,     :state,          :zip_code,   :phone,    :cell_phone,   :wife_name, 
         :wife_date_of_birth,       :wedding_anniversary,      :diocese_of_ordination, 
        :ordination_date,     :diocese_of_incardination,      :incardination_date, 
         :military_service,      :military_branch,     :military_period, :military_years,      :military_rank,      :faculties,   :preaching,     :status, 
     :employer,   :employer_address,     :secondary_address, :secondary_city,      :secondary_state, :secondary_zip, 
        :secondary_phone,      :assignment,      :assignment_location, :assignment_pastor,    :emergency_contact_name,     :emergency_contract_phone,
         :highschool,  :under_graduate,      :graduate,      :doctorate,      :field_of_study,
         :prior_employment_description,  :prior_diaconate_ministry,   :picture )
    end
    
    # Before filters
    
    
   
end