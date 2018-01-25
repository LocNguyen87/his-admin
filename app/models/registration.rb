class Registration < Parse::Object
  # See: https://github.com/modernistik/parse-stack#defining-properties


  # form data fields
  property :fullName, :string
  property :email, :string
  property :phone, :string
  property :address, :string
  property :region, :string
  property :type, :string
  property :nation, :string
  property :hasVisa, :boolean
  property :budget, enum: [:bigBudget, :moderateBudget, :smallBudget]
  property :time, enum: [:goThisMonth, :goNextMonth, :goOtherTime]
  property :request, :string

  # referrer data
  property :original_url, :string
  property :utm_source, :string
  property :utm_medium, :string
  property :utm_campaign, :string
  property :gclid, :string

  # client devices
  property :device, :string
  property :system, :string

  # user behavior
  property :readingTime, :float
  property :scrolled, :float

  # potential score
  property :potentialScore, :float, default: lambda { |x|
    score = 0
    # maximum score is 10, will be calculated base on hasVisa, budget, time, readingTime, scrolled
    score += 2 if x.hasVisa?

    score += 2 if x.bigBudget?
    score += 1 if x.moderateBudget?

    score += 2 if x.goThisMonth?
    score += 1 if x.goNextMonth?

    score += 2 if (10.0 <= x.readingTime)
    score += 1 if x.readingTime.between?(5, 10)

    score += (x.scrolled * 2 / 100)

    return score
  }

  # See: https://github.com/modernistik/parse-stack#cloud-code-webhooks
  # define a before save webhook for Registration
  webhook :before_save do
    registration = parse_object
    # perform any validations with artist
    # use `error!(msg)` to fail the save
    # ...
    registration
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
