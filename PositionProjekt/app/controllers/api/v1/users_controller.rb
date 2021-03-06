
module Api
 module V1

    class UsersController < ApplicationController
      before_action do
        validateAPIKey(params[:apikey])

      end
      before_filter :authenticateJWT,:only => [:destroy, :update]
      before_filter :allowPost, :only => [:login]
      respond_to :json

      def login

        @user = User.find_by_email(request.headers["email"])
        if @user && @user.authenticate(request.headers["password"])
          jwt = create_token(@user.id);
          render :json => {:success => "User was able to login", :jwt => jwt}, status: :ok and return
        else

          if !@user

            if request.headers["email"] == nil

              render :json => {:error => "User must provide Email"}, status: :bad_request and return
            end

            render :json => {:error => "User with Email #{request.headers["email"]} was not found"}, status: :bad_request and return
          else
            if !@user.authenticate(request.headers["password"])

              render :json => {:error => "The password was incorrect"}, status: :bad_request and return

            end
          end
        end
      end

      def index
        users = User.all.paginate(page: params[:page], per_page: 15)

        if(users.total_entries > users.current_page * users.per_page)
          nextpage = "/api/v1/users?page="+(users.current_page + 1).to_s
        else
          nextpage = "null"
        end
        if(users.current_page > 1)
          prevpage = "/api/v1/users?page="+(users.current_page - 1).to_s
        else
          prevpage = "null"
        end

        respond_with(users) do |format|
          format.json {
            render :json => {
                       :current_page => users.current_page,
                       :per_page => users.per_page,
                       :total_entries => users.total_entries,
                       :entries => users,
                       :next_page => nextpage,
                       :prev_page => prevpage
                   }, status: :ok
          }
        end
      end

      def show
        begin
          respond_with User.find(params[:id])
        rescue Exception
          render :json => {:error => "User with ID #{params[:id]} was not found"}, status: :bad_request
        end

      end

      def create
        #Kan ju inte ha krav på inloggning när man skapar användare ?? :S
        #user_id = getUserFromAuthorizationToken

        #if(user_id.respond_to?(:to_i))
        begin
          @user = User.new(user_params)
          @user.save
          #respond_with :api, :v1, @user
            render :json => {:success => "User was created", :user => @user}, status: :ok
        rescue
          render :json => {:error => "could not create user with the data provided"}, status: :bad_request
        end

        #end


      end

      def update
        user_id = getUserFromAuthorizationToken
        puts user_id  == params[:id]
        puts params[:id]
        puts user_id
        puts user_id.respond_to?(:to_i)
        if(user_id.respond_to?(:to_i) && user_id.to_i === params[:id].to_i)

          @user = User.find(user_id)
          @user.update(user_params)
          # @user.email = params[:email]
          # @user.password = params[:password]
          @user.save
          render json: {success: "The user was updated", :user => @user}, status: :ok
        else
          render json: {error: "The user was not updated, only the user can change their data"}, status: :unauthorized
        end


      end

      def destroy
        user_id = getUserFromAuthorizationToken
        if(user_id.respond_to?(:to_i) && user_id.to_i === params[:id].to_i)
          begin
            @user = User.find(user_id)
            @user.destroy
            @user.save
            render json: {success: "The user was removed"}, status: :ok and return
          rescue
            render json: {error: "The user with the id #{params[:id]} was not found"}, status: :not_found and return
          end

        else
          render json: {error: "The user was not removed, only a user can delete itself"}, status: :unauthorized and return
        end

      end

      private
      def user_params
        params.permit(:email, :password)
      end

    end
  end
end