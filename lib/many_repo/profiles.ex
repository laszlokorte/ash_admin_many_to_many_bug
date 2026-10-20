defmodule ManyRepo.Profiles do
  use Ash.Domain, otp_app: :feel_me, extensions: [AshAdmin.Domain]

  admin do
    show? true
    name "Profiles"

    show_resources [
      ManyRepo.Profiles.Profile,
      ManyRepo.Profiles.Language,
      ManyRepo.Profiles.ProfileLanguage
    ]
  end

  resources do
    resource ManyRepo.Profiles.Profile
    resource ManyRepo.Profiles.Language
    resource ManyRepo.Profiles.ProfileLanguage
  end
end
