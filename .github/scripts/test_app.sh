set -eo pipefail

xcodebuild -workspace Teste_ML.xcworkspace \
            -scheme Teste_ML \
            -destination platform=iOS Simulator,name=iPhone 8,OS=13.2.2 \
            clean test | xcpretty

