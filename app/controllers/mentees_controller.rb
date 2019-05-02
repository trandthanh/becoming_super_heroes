class MenteesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :confirm]

  HOSPITALS = ['Institut Curie', 'Pitié Salpétrière', 'Saint-Louis']
  SICKNESSES = [
    'Cancer du Cerveau',
    'Cancer du Côlon / Rectum',
    "Cancer de l'Endomètre",
    "Cancer de l'Estomac",
    'Cancer du Foie',
    "Cancer de l'Intestin Grêle",
    "Cancer Lèvre / Bouche / Larynx",
    "Cancer de l'Oesophage",
    'Cancer des Os',
    'Cancer des Ovaires',
    'Cancer du Pancréas',
    'Cancer de la Peau',
    'Cancer de la Plèvre',
    'Cancer du Poumon',
    'Cancer de la Prostate',
    'Cancer du Rein',
    'Cancer du Sein',
    'Cancer des Testicules',
    'Cancer de la Thyroïde',
    "Cancer du col de l'Utérus",
    'Cancer de la Vessie',
    'Leucémie',
    'Lymphome'
  ]
  HEAD_HOBBIES = Subject.where(category: 'Tête')
  BODY_HOBBIES = Subject.where(category: 'Corps')

  def new
    @mentee = Mentee.new
    @hospitals = HOSPITALS
    @sicknesses = SICKNESSES
    @head_hobbies = HEAD_HOBBIES
    @body_hobbies = BODY_HOBBIES
  end

  def create
    @mentee = Mentee.new(mentee_params)

    if params[:other][:email].blank?
      redirect_to new_mentee_path, notice: "Veuillez renseigner votre email afin que nous puissions vous contacter !"
    elsif !User.where(email: params[:other][:email]).exists?
      if @mentee.save
        @user = User.create(email: params[:other][:email], password: "123456", first_name: params[:other][:first_name], last_name: params[:other][:last_name], zipcode: params[:other][:zipcode])
        @user.mentee = @mentee
        @user.save
      end
      redirect_to mentees_confirm_path
    elsif User.where(email: params[:other][:email]).exists?
      @user = User.find_by(email: params[:other][:email])
      if @mentee.save
        @user.mentee = @mentee
        @user.save
      end
      redirect_to mentees_confirm_path
    else
      redirect_to new_mentee_path, notice: "Veuillez réessayer."
    end
  end

  private

  def mentee_params
    params.require(:mentee).permit(:hospital, :sickness, :hobby_one, :hobby_two, :user, :avatar)
  end
end
