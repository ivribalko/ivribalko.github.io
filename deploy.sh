flutter pub get
flutter build web
mkdir -p docs
# docs is set as source folder for GitHub Pages in repository's Settings
cp -avr build/web/* docs/
git add *
git commit -am "deploy"
git push
# GitHub Actions deploys website after that
