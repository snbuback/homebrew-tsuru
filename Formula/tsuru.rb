require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.8.5.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '40af4d843e2305b060bb2a80c6d27652581c075e3eec2985e6ce21c3471bd0d9'

  depends_on 'go'

  def install
    system "bash", "-c", "export GOVERSION=$(go version | cut -d' ' -f3) && [ \"x$GOVERSION\" = \"xdevel\" ] || [ \"x$GOVERSION\" = \"xgo1.1\" ] || [ \"x$GOVERSION\" = \"xgo1.2\" ] || [ \"x$GOVERSION\" = \"xgo1.1.1\" ] || [ \"x$GOVERSION\" = \"xgo1.1.2\" ] || (echo && echo \"ERROR: tsuru requires Go 1.1 or later, your version is $GOVERSION\" && exit 1)"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/globocom/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru"
  end
end
