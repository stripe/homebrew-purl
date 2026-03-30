# Homebrew formula for Purl
class Purl < Formula
  desc 'A curl-esque CLI for making HTTP requests that require payment.'
  homepage 'https://purl.dev'
  url 'https://github.com/stripe/purl/archive/refs/tags/v0.2.4.tar.gz'
  sha256 '09bba7b4119b28680b56e8923ebc59fcf7490ce78ee3cf5436977dc28c2c7bed'
  license 'MIT'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'cli')
  end

  test do
    assert_match "purl #{version}", shell_output("#{bin}/purl --version")
  end
end
