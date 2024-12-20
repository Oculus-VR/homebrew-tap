# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class MetaXrSimulatorQa < Formula
  desc "Meta XR Simulator (QA release)"
  homepage "https://developer.oculus.com/downloads/package/meta-xr-simulator/"
  url "https://github.com/Oculus-VR/homebrew-repo/raw/main/repo/meta-xr-simulator/meta-xr-simulator-71.0.0-beta.3.tar.gz"
  sha256 "d7d0ac340fd1b4575f197fbdd75631e1805fbf42b856086f8a86acb3a16bd7d6"
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
    opoo "By installing this software, you agree to Meta Platform Technologies SDK License, which can be found at: https://developer.oculus.com/licenses/oculussdk/"
    opoo "More details for setting up OpenXR on macOS can be found at https://github.com/Oculus-VR/homebrew-repo/blob/main/meta-xr-simulator.md"
    puts
    unless File.exist?("/usr/local/lib/libvulkan.1.dylib") && File.exist?("/usr/local/lib/libMoltenVK.dylib")
      opoo "\u{1F6D1} Vulkan SDK and/or MoltenVK not found in /usr/local/lib \u{1F6D1}"
      opoo "Please follow the instruction on https://vulkan.lunarg.com/doc/sdk/latest/mac/getting_started.html, using using 'System Global Installation'."
      puts
    end
    opoo "\u{1F950} Please run the following command to activate Meta XR Simulator \u{1F950}"
    opoo "sudo #{prefix}/post_installation_macos.sh"
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
