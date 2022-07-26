module ErrorHandling

  def likeable_type_valid?
    get_likeable_id != 'fail'
  end

  def exist?(likeable_id)
    Like.exists?(likeable_id)
  end

  def invalid_likeable_type_error
    { status: 'error', code: 3001, message: 'invalid likeable type' }
  end

  def no_type_error
    { status: 'error', code: 3001, message: 'no type' }
  end

  def exist_like_error
    { status: 'error', code: 3002, message: 'this type has like' }
  end
end


