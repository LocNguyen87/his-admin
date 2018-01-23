
class Artist < Parse::Object
  # See: https://github.com/modernistik/parse-stack#defining-properties

  # You can change the inferred Parse table/collection name below
  # parse_class "Artist"

  property :name, :string

  # See: https://github.com/modernistik/parse-stack#cloud-code-webhooks
  # define a before save webhook for Artist
  webhook :before_save do
    artist = parse_object
    # perform any validations with artist
    # use `error!(msg)` to fail the save
    # ...
    artist
  end

  ## define an after save webhook for Artist
  #
  # webhook :after_save do
  #   artist = parse_object
  #
  # end

  ## define a before delete webhook for Artist
  # webhook :before_delete do
  #   artist = parse_object
  #   # use `error!(msg)` to fail the delete
  #   true # allow the deletion
  # end

  ## define an after delete webhook for Artist
  # webhook :after_delete do
  #   artist = parse_object
  # end

  ## Example of a CloudCode Webhook function
  ## define a `helloWorld` Parse CloudCode function
  # webhook :function, :helloWorld do
  #   "Hello!"
  # end

end
