defmodule ManyRepo.Profiles.Profile do
  use Ash.Resource,
    domain: ManyRepo.Profiles,
    data_layer: AshSqlite.DataLayer,
    extensions: [AshAdmin.Resource]

  sqlite do
    table "profiles"
    repo ManyRepo.Repo
  end

  admin do
    label_field :name

    table_columns [:id, :name, :inserted_at, :updated_at]

    form do
      field :description, type: :long_text
    end
  end

  actions do
    defaults [:read, :destroy]

    create :create do
      accept [:date_of_birth, :name, :description]
    end

    create :create_with_langauge do
      accept [:date_of_birth, :name, :description]
      argument :languages, {:array, :map}

      change manage_relationship(:languages,
               type: :append_and_remove
             )
    end

    update :update do
      accept [:name, :description, :date_of_birth]

      argument :languages, {:array, :map}

      change manage_relationship(:languages,
               type: :append_and_remove
             )
    end

    update :update_only_languages do
      require_atomic? false
      argument :languages, {:array, :map}

      change manage_relationship(:languages,
               type: :append_and_remove
             )
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      public? true
    end

    attribute :date_of_birth, :date do
      public? true

      allow_nil? false
    end

    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  relationships do
    many_to_many :languages, ManyRepo.Profiles.Language do
      through ManyRepo.Profiles.ProfileLanguage
    end
  end
end
