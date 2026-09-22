# Homebrew formula for Purl
class Purl < Formula
  desc 'A curl-esque CLI for making HTTP requests that require payment.'
  homepage 'https://purl.dev'
  url 'https://github.com/stripe/purl/archive/refs/tags/v0.2.10.tar.gz'
  sha256 '0d688fee97a9df02c28ae365d616487f1637f2b882fa4517ca7197a88e645ef2'
  license 'MIT'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'cli')
  end

  test do
    assert_match "purl #{version}", shell_output("#{bin}/purl --version")
  end
end
