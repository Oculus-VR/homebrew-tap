# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class MetaXrSimulator < Formula
  desc "Meta XR Simulator"
  homepage "https://developer.oculus.com/downloads/package/meta-xr-simulator/"
  url "https://github.com/Oculus-VR/homebrew-repo/raw/main/repo/meta-xr-simulator/meta-xr-simulator-64.0.0-alpha.2.tar.gz"
  sha256 "310e9c5ed0180e94a91e9894533616b426edfef2f373964ae0e7f1dd49116ef6"
  license "Meta Platform Technologies SDK"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    prefix.install Dir["*"]
    puts
    ohai "\u{1F950} Please run the following commands to set Meta XR Simulator as the active OpenXR runtime:"
    puts "sudo xattr -d com.apple.quarantine #{prefix}/SIMULATOR.so"
    puts "sudo mkdir -p /usr/local/share/openxr/1"
    puts "sudo ln -s #{prefix}/meta_openxr_simulator.json /usr/local/share/openxr/1/active_runtime.json
    "
    ohai "\u{1F37A} More details for setting up OpenXR on macOS can be found at https://github.com/Oculus-VR/homebrew-repo/blob/main/meta-xr-simulator.md"
    ohai "\u{26F3} By installing this software, you agree to Meta Platform Technologies SDK License, which can be found at: https://developer.oculus.com/licenses/oculussdk/"
    puts
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test meta-xr-simulator`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
