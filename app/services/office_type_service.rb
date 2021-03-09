class OfficeTypeService

  require_relative '../repositories/office_type_repository'

  def index
      office_type_repo.get_all_office_types
  end


  def create(payload)
    office_type_repo.save_office_type(payload)
  end


  def show(id)
    office_type_repo.find_office_type_by_id(id)
  end


  def update(id, payload)
    office_type_repo.update_office_type(id, payload)
  end


  def destroy(id)
    office_type_repo.delete_office_type_data(id)
  end


  def last_inserted
    office_type_repo.last_inserted_office_type
  end


  private
  def office_type_repo
    @repo ||= OfficeTypeRepository.new
  end

end