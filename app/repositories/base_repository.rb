class BaseRepository

  def get_all(model, page, limit)
    if limit.to_i == -1
      model.all
    else
      model.all.paginate(page: page, :per_page => limit)
    end
  end

  def save_data(model, payload)
    @data = model.create(payload)
  end

  def find_by_id(model, id)
    model.find(id)
  end

  def update_data(model, id, payload)
    @data = find_by_id(model, id)
    @data.update(payload)
  end

  def delete_data(model, id)
    model.destroy(id)
  end

  def last_inserted(model)
    model.last!
  end

end