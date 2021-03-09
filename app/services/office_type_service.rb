class OfficeTypeService

  require_relative '../repositories/office_type_repository'

  def index
    office_type_repo.all
  end


  private
  def office_type_repo
    @repo ||= OfficeTypeRepository.new
  end

end