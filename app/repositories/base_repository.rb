class BaseRepository

  def get_all(model)
    model.all
  end

  def save_data(model, payload)
    @data = model.new(payload)
    @data.save
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