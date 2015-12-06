require "refile/simple_form"
require "refile/s3"

unless ENV["CI"] || Rails.env.development?
  aws = {
    access_key_id: ENV["AWS_ACCESS_KEY"],
    secret_access_key: ENV["AWS_SECRET_KEY"],
    bucket: ENV["AWS_BUCKET"],
    region: ENV["AWS_REGION"]
  }

  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
