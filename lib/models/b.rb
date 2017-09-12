class B

  include Mongoid::Document

  embeds_many :cs

  embedded_in :a

  field :api_code

  before_validation :set_api_code

  private

  def set_api_code
    if self.api_code.blank?
      self.api_code = 'Default Api Code B'
    end
  end

end
