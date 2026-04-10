# Homebrew formula for Purl
class Purl < Formula
  desc 'A curl-esque CLI for making HTTP requests that require payment.'
  homepage 'https://purl.dev'
  url 'https://github.com/stripe/purl/archive/refs/tags/v0.2.6.tar.gz'
  sha256 'bf31e47e80c878793ca13d88fc2a115791e2c476b4d07ae6b5af2987dc31bb9a'
  license 'MIT'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'cli')
  end

  test do
    assert_match "purl #{version}", shell_output("#{bin}/purl --version")
  end
end
