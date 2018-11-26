class Extraction
  include ActiveModel::Model

  attr_reader :url, :filename

  validates :url, url: true
  validates :filename, presence: true

  def initialize(params)
    @url = params[:url]
    @filename = params[:filename]
  end
end
