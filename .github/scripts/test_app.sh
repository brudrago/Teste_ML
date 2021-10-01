set -eo pipefail

xcodebuild -workspace Teste_ML.xcworkspace \
            -scheme Teste_ML \ iOS \
            -destination platform=iOS\ Simulator,OS=14.4,name=iPhone\ 11 \
            clean test | xcpretty

