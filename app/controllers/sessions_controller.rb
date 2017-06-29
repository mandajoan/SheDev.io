class SessionsController < ApplicationController

  def create
     # find user by email, in DB
         @user = User.find_by_email(params[:login][:email])
         # if user exists & they put in the right password:
         if @user && @user.authenticate(params[:login][:password])
           # generate cookie(one liner built into rails)
           session[:user_id] = @user.id
           # and redirect to user show (profile)
           redirect_to user_path(@user.id)
         else
           # redirect to login page
           redirect_to login_path
         end
     end

       def destroy
         flash[:notice]="You have been logged-out!"
         session[:user_id] = nil
         redirect_to login_path
       end
     end
