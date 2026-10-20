defmodule ManyRepo.Profiles.Language do
  use Ash.Resource,
    domain: ManyRepo.Profiles,
    data_layer: AshSqlite.DataLayer,
    extensions: [AshAdmin.Resource]

  sqlite do
    table "languages"
    repo ManyRepo.Repo
  end

  admin do
    label_field :name
  end

  actions do
    defaults [:read, :update, :destroy]

    create :create do
      accept [:name, :code]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :code, :string do
      allow_nil? false
      public? true
    end
  end

  relationships do
    many_to_many :profiles, ManyRepo.Profiles.Profile do
      through ManyRepo.Profiles.ProfileLanguage
    end
  end

  identities do
    identity :unique_code, [:code]
  end
end
