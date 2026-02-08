class Clarissa < Formula
  desc "AI-powered terminal assistant with tool execution capabilities"
  homepage "https://clarissa.run"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cameronrye/clarissa/releases/download/v1.5.0/clarissa-macos-arm64"
      sha256 "cf054a2c0b7d42ba3c0443ad630474f56033c3d26c33f2af0a56465e1cc81596"

      def install
        bin.install "clarissa-macos-arm64" => "clarissa"
      end
    end

    on_intel do
      url "https://github.com/cameronrye/clarissa/releases/download/v#{version}/clarissa-macos-x64"
      sha256 "16b57cc26a79e096509d2d02b94b579848126e1cfaaa2c48793516cc1228e9de"

      def install
        bin.install "clarissa-macos-x64" => "clarissa"
      end
    end
  end

  def caveats
    <<~EOS
      To get started, run:
        clarissa init

      For cloud providers, set your API key:
        export OPENROUTER_API_KEY=your_key_here

      For local inference with Apple Intelligence (macOS 26+):
        clarissa --model apple

      Documentation: https://clarissa.run/docs/installation/
    EOS
  end

  test do
    assert_match "clarissa", shell_output("#{bin}/clarissa --version")
  end
end

