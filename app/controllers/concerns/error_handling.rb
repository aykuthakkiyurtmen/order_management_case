module ErrorHandling

  def likeable_type_valid?
    get_likeable_id != Constants::FAIL
  end

  def exist?(likeable_id)
    Like.exists?(likeable_id: likeable_id)
  end

  def valid
    return no_type_error if get_likeable_id.nil?
    return invalid_likeable_type_error unless likeable_type_valid?
    return exist_like_error if exist?(@like.likeable_id)

    succeeded
  end

  private

  def succeeded
    { status: 'ok' }
  end

  def invalid_likeable_type_error
    { status: 'error', code: 3001, message: 'invalid likeable type' }
  end

  def no_type_error
    { status: 'error', code: 3002, message: 'no type' }
  end

  def exist_like_error
    { status: 'error', code: 3003, message: 'this type has like item' }
  end

  def unknown_error
    { status: 'error', code: 3000, message: 'unknown error' }
  end
end


