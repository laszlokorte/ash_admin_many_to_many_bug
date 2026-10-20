defmodule ManyRepo.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        ManyRepo.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:many_repo, :token_signing_secret)
  end
end
