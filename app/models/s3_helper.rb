module S3Helper
  module_function

  def url(path)
    "https://#{ S3_ENDPOINT }/#{ S3_BUCKET }/#{ path.to_s.gsub(%r{^/+}, '') }"
  end
end
