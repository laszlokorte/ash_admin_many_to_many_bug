defmodule ManyRepo.Profiles.ProfileLanguage do
  use Ash.Resource,
    domain: ManyRepo.Profiles,
    data_layer: AshSqlite.DataLayer,
    extensions: [AshAdmin.Resource],
    authorizers: [Ash.Policy.Authorizer]

  sqlite do
    table "profile_languages"
    repo ManyRepo.Repo
  end

  actions do
    defaults [:read, :destroy]

    create :create do
      primary? true
      accept [:profile_id, :language_id]
    end

    update :update do
      primary? true
      accept [:profile_id, :language_id]
    end
  end

  policies do
    policy action_type(:read) do
      authorize_if actor_present()
    end
  end

  attributes do
    uuid_primary_key :id
  end

  relationships do
    belongs_to :profile, ManyRepo.Profiles.Profile do
      allow_nil? false
      public? true
    end

    belongs_to :language, ManyRepo.Profiles.Language do
      allow_nil? false
      public? true
    end
  end
end
