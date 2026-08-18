# Homebrew formula for Purl
class Purl < Formula
  desc 'A curl-esque CLI for making HTTP requests that require payment.'
  homepage 'https://purl.dev'
  url 'https://github.com/stripe/purl/archive/refs/tags/v0.2.9.tar.gz'
  sha256 '872157e36356f007328f6377106f6e4dc44dad3b770ceb652efd907178ddb9e3'
  license 'MIT'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'cli')
  end

  test do
    assert_match "purl #{version}", shell_output("#{bin}/purl --version")
  end
end
