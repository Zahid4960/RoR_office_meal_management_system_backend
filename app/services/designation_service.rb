class DesignationService

  require_relative '../repositories/designation_repository'
  require_relative '../models/designation'

  @@model = Designation

  def index(page, limit)
    designation_repo.designation_with_office(page, limit)
  end

  def create(payload)
    designation_repo.save_data(@@model, payload)
  end

  def show(id)
    designation_repo.find_designation_with_office(id)
  end

  def update(id, payload)
    designation_repo.update_data(@@model, id, payload)
  end

  def destroy(id)
    designation_repo.delete_data(@@model, id)
  end

  def last_inserted
    designation_repo.last_inserted(@@model)
  end

  def designation_repo
    @repo = DesignationRepository.new
  end
end