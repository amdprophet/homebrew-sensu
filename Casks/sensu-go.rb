cask "sensu-go" do
  version "6.2.7"

  tarball_os = ""
  tarball_arch = ""
  arch = Hardware::CPU.arch

  if OS.linux?
    tarball_os = "linux"

    case arch
    when :x86_64
      sha256 "a3975544da13720908f43f48cce0a8c2ebf2f7d9491955376242e5cd171f3e38"
      tarball_arch = "amd64"
    when :i386
      sha256 "f49bbf62199d0657094dcec3ce4d3be1b19684c56ee0f5a801231905858b2a4f"
      tarball_arch = "386"
    when :arm64
      sha256 "ce3aa1c40e3735e2e877aa74b8ad6ed3a4df0601af03e65fdf430b7d73472347"
      tarball_arch = "arm64"
    when :arm
      sha256 "6e8da95a1dea69f4f99f6b7f3d9d94258d4ab258fe905379844b823e80a0d62d"
      tarball_arch = "armv5"
    else
      raise "#{cask} cask is not supported on linux/#{arch}"
    end
  end

  if OS.mac?
    tarball_os = "darwin"

    case arch
    when :x86_64, :arm64
      sha256 "c5486070ea22861ea23236731494947995c1ea565d7bc87208b030debf18d54b"
      tarball_arch = "amd64"
    else
      raise "#{cask} cask is not supported on macOS/#{arch}"
    end
  end

  url "https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/#{version}/sensu-go_#{version}_#{tarball_os}_#{tarball_arch}.tar.gz"
  name "Sensu Go"
  name "sensu-agent"
  name "sensuctl"
  desc ""
  homepage "https://sensu.io"

  container type: :tar

  binary "sensu-agent"
  binary "sensuctl"

  caveats do
    license "https://sensu.io/licenses"
  end
end
