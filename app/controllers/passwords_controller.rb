class PasswordsController < ApplicationController
  def new
    @password = params[:password]
    @case_option = params[:case] || :lowercase
    @add_non_letter = params[:add_non_letter] == "1"
    @password_length = params[:password_length] || 12
    @non_letter_count = params[:non_letter_count] || 1
  end

  def create
    options = {
      case: params[:case].to_sym,
      add_non_letter: params[:add_non_letter] == "1",
      password_length: params[:password_length].to_i,
      non_letter_count: params[:non_letter_count].to_i
    }
    generator = PronouncablePasswordGenerator.new(options)
    @password = generator.generate

    redirect_to root_path(password: @password, case: params[:case], add_non_letter: params[:add_non_letter], password_length: params[:password_length], non_letter_count: params[:non_letter_count])
  end
end