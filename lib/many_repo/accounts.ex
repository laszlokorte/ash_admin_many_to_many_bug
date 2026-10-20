defmodule ManyRepo.Accounts do
  use Ash.Domain, otp_app: :many_repo, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource ManyRepo.Accounts.Token
    resource ManyRepo.Accounts.User
  end
end
