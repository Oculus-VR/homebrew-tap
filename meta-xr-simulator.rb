# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class MetaXrSimulator < Formula
  desc "Meta XR Simulator"
  homepage "https://developer.oculus.com/downloads/package/meta-xr-simulator/"
  url "https://github.com/Oculus-VR/homebrew-repo/raw/main/repo/meta-xr-simulator/meta-xr-simulator-64.0.0-alpha.1.tar.gz"
  sha256 "7dbd29410cc0127100852258f9ade2527ce4106196bd585639603993a3c3fb59"
  license "Oculus SDK"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    prefix.install Dir["*"]
    puts "Installation complete!"
    puts
    ohai "Please run the following commands to allow OpenXR apps to load it as the active runtime:"
    puts "sudo xattr -d com.apple.quarantine #{prefix}/SIMULATOR.so"
    puts "sudo mkdir -p /usr/local/share/openxr/1"
    puts "ln -s #{prefix}/meta_openxr_simulator.json /usr/local/share/openxr/1/active_runtime.json
    "
    ohai "More instructions in https://github.com/Oculus-VR/homebrew-repo/blob/main/meta-xr-simulator.md"
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
