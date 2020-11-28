class DotenvOp < Formula
  desc "Manage and share your dotenv files with 1Password from your terminal"
  homepage "https://github.com/Kinoba/dotenv-op"
  url "https://github.com/Kinoba/dotenv-op/releases/download/v0.1/dotenv-op.tar.gz"
  sha256 "a76888e17352bc4c7e4d0cf9ab3b3e26c25bdc90b42cd83c07b452ae6852c4db"
  license "MIT"

  bottle :unneeded

  def install
    bin.install "dotenv-op.sh" => "dotenv-op"
  end

  def post_install
    return if ENV["CI"]

    puts <<~EOS
      ###############################################################################################################
      #                                                                                                             #
      # Don't forget to add the following variables to your .bash_profile:                                          #
      #                                                                                                             #    
      # DOTENVOP_VAULT="[vault]"          => The .env file will be stored in this vault                             #
      # DOTENVOP_ACCOUNT="[name]"         => This is your 1Password account name                                    #
      # DOTENVOP_EMAIL="[your@email.com]" => This is the email you use to connect to your 1Password account         #
      #                                                                                                             #
      ###############################################################################################################
    EOS
  end

  test do
    assert_includes shell_output("#{bin}/dotenv-op -h", 1).chomp, "usage"
  end
end
