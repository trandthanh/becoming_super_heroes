class WishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @wish = Wish.new

    @track = Track.new

    @head_subjects = Subject.where(category: 'Tête')
    @body_subjects = Subject.where(category: 'Corps')
  end

  def create
    @wish = Wish.new(wish_params)
    @users = User.all

    if User.where(email: params[:other][:email]).exists?
      @user = User.find_by(email: params[:other][:email])
      @wish.user = @user
      if @wish.save
        params[:wish][:track_ids].delete("")
        @tracks = params[:wish][:track_ids]
        @tracks.each do |track|
          Track.create(wish: @wish, subject: Subject.find(track.to_i))
        end
      else
        render :new
      end
      redirect_to root_path
    else
      @user = User.create(email: params[:other][:email], password: "123456")
      @wish.user = @user
      if @wish.save
        params[:wish][:track_ids].delete("")
        @tracks = params[:wish][:track_ids]
        @tracks.each do |track|
          Track.create(wish: @wish, subject: Subject.find(track.to_i))
        end
      else
        render :new
      end
      redirect_to root_path
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:user)

  end

end
