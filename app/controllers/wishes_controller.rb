class WishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :confirm]

  def new
    @wish = Wish.new

    @track = Track.new

    @head_subjects = Subject.where(category: 'Tête')
    @body_subjects = Subject.where(category: 'Corps')
  end

  def create
    @wish = Wish.new(wish_params)
    @users = User.all
    @head_subjects = Subject.where(category: 'Tête')
    @body_subjects = Subject.where(category: 'Corps')

    if params[:other][:email].blank?
      redirect_to new_wish_path, notice: "Votre formulaire n'est malheureusement assez pas rempli ..."
    elsif !User.where(email: params[:other][:email]).exists?
      params[:wish][:track_ids].delete("")
      @tracks = params[:wish][:track_ids]
      @user = User.create(email: params[:other][:email], password: "123456", first_name: params[:other][:first_name], last_name: params[:other][:last_name], zipcode: params[:other][:zipcode])
      @wish.user = @user
      if @tracks.any? || @tracks.size > 1
        @wish.save
        @tracks.each do |track|
          Track.create(wish: @wish, subject: Subject.find(track.to_i))
        end
        redirect_to wishes_confirm_path
      else
      redirect_to new_wish_path, notice: "Vous devez sélectionner au moins 2 cours. bis"
      end
    elsif User.where(email: params[:other][:email]).exists?
      @user = User.find_by(email: params[:other][:email])
      @wish.user = @user
      params[:wish][:track_ids].delete("")
      @tracks = params[:wish][:track_ids]
      if @tracks.any? || @tracks.size > 1
        @wish.save
        @tracks.each do |track|
          Track.create(wish: @wish, subject: Subject.find(track.to_i))
        end
        redirect_to wishes_confirm_path
      else
      redirect_to new_wish_path, notice: "Vous devez sélectionner au moins 2 cours."
      end
    else
      redirect_to new_wish_path, notice: "Vous devez nous renseigner vos infos personnelles."
    end
  end

  def confirm
  end

  private

  def wish_params
    params.require(:wish).permit(:user, :wish_head, :wish_body)
  end

end
