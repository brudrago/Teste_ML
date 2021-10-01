set -eo pipefail

xcodebuild -workspace Teste_ML.xcworkspace \
            -scheme Teste_ML \
            -destination platform=iOS\ Simulator,OS=14.5,name=iPhone\ 11 \
            clean test | xcpretty

