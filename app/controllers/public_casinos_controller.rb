class PublicCasinosController < SecuredController
  def index
    @casinos = Casino.where(public: true)
  end

  def set
    Casino.set_visibility(params[:casino_ids])
    redirect_to public_casinos_url, notice: 'Visibility saved.'
  end
end
