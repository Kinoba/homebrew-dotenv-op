class DotenvOp < Formula
  desc "Manage and share your dotenv files with 1Password from your terminal"
  homepage "https://github.com/Kinoba/dotenv-op"
  url "https://github.com/Kinoba/dotenv-op/releases/download/v0.3.1/dotenv-op.tar.gz"
  sha256 "bd4fbc27bfde2ae2a32c4e698174f61577a49091f3539690a4ac4642f3aa660c"
  license "MIT"

  def install
    bin.install "dotenv-op.sh" => "dotenv-op"
  end

  def post_install
    return if ENV["HOMEBREW_GITHUB_ACTIONS"]

    puts <<~EOS

      ###############################################################################################################
      #                                                                                                             #
      # Don't forget to add the following variables to your .bash_profile/.zshrc:                                   #
      #                                                                                                             #
      # export DOTENVOP_VAULT="[vault]"          => The .env file will be stored in this vault                      #
      # export DOTENVOP_ACCOUNT="[name]"         => This is your 1Password account name                             #
      # export DOTENVOP_EMAIL="[your@email.com]" => This is the email you use to connect to your 1Password account  #
      #                                                                                                             #
      ###############################################################################################################

    EOS
  end

  test do
    assert_includes shell_output("#{bin}/dotenv-op -h", 1).chomp, "usage"
    assert_includes shell_output("#{bin}/dotenv-op -h", 1).chomp, "specify vault"
    assert_includes shell_output("#{bin}/dotenv-op -h", 1).chomp, "specify name"
  end
end
