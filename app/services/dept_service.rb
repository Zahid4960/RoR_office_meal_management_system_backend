class DeptService

  require_relative '../repositories/dept_repository'
  require_relative '../models/department'

  @@model = Department

  def index
    dept_repo.dept_with_office
  end

  def create(payload)
    dept_repo.save_data(@@model, payload)
  end

  def show(id)
    dept_repo.find_by_id_with_office(id)
  end

  def update(id, payload)
    dept_repo.update_data(@@model, id, payload)
  end

  def destroy(id)
    dept_repo.delete_data(@@model, id)
  end

  def last_inserted
    dept_repo.last_inserted(@@model)
  end

  private
  def dept_repo
    @repo ||= DeptRepository.new
  end
end