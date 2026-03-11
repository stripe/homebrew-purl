# Homebrew formula for Purl
class Purl < Formula
  desc 'A curl-esque CLI for making HTTP requests that require payment.'
  homepage 'https://purl.dev'
  url 'https://github.com/stripe/purl/archive/refs/tags/v0.1.2.tar.gz'
  sha256 '55714c1fdef3d8aeb203777dd276c59a29461d0b23c36b7721dfc597dadb7875'
  license 'MIT'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'cli')
  end

  test do
    assert_match "purl #{version}", shell_output("#{bin}/purl --version")
  end
end
