class DeptService

  require_relative '../repositories/dept_repository'


  def index
    dept_repo.get_all_dept
  end


  private
  def dept_repo
    @repo ||= DeptRepository.new
  end
end