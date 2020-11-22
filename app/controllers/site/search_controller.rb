class Site::SearchController < SiteController

  def questions
    # @questions = Question.includes(:answers).page(params[:page])
    @questions = Question.includes(:answers)
                         .where("lower(description) LIKE ?", "%#{params[:term].downcase}%")
                         .page(params[:page])
  end

end
