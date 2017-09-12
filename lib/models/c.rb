class C

  include Mongoid::Document

  field :api_code

  embedded_in :b

  before_validation :set_api_code

  private

  def set_api_code
    if self.api_code.blank?
      self.api_code = 'Default Api Code C'
    end
  end

end
