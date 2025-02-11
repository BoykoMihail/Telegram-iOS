# Compilation Guide

1. Install Xcode (directly from https://developer.apple.com/download/more or using the App Store).
2. Clone the project from GitHub:

```
git clone --recursive -j8 git@github.com:BoykoMihail/Telegram-iOS.git
```

3. Adjust configuration parameters (from project folder)

```
mkdir -p $HOME/telegram-configuration
mkdir -p $HOME/telegram-provisioning
cp build-system/appstore-configuration.json $HOME/telegram-configuration/configuration.json
cp -R build-system/fake-codesigning $HOME/telegram-provisioning/ 
```

- Modify the values in `configuration.json` ("enable_siri": false, "enable_icloud": false)

4. (Optional) Create a build cache directory to speed up rebuilds. (need to install bazel: brew install bazel)

```
mkdir -p "$HOME/telegram-bazel-cache"
```

5. Build the app

```
python3 build-system/Make/Make.py \
    --cacheDir="$HOME/telegram-bazel-cache" \
    generateProject \
    --configurationPath="$HOME/telegram-configuration/configuration.json" \
    --codesigningInformationPath=$HOME/telegram-provisioning/fake-codesigning \
    --disableExtensions \
    --disableProvisioningProfiles
```

Tip: use `--disableExtensions` when developing to speed up development by not building application extensions and the WatchOS app.


# Tips

Bazel is used to build the app. To simplify the development setup a helper script is provided (`build-system/Make/Make.py`). See help:

```
python3 build-system/Make/Make.py --help
python3 build-system/Make/Make.py build --help
python3 build-system/Make/Make.py generateProject --help
```

Bazel is automatically downloaded when running Make.py for the first time. If you wish to use your own build of Bazel, pass `--bazel=path-to-bazel`. If your Bazel version differs from that in `versions.json`, you may use `--overrideBazelVersion` to skip the version check.

Each release is built using specific Xcode and Bazel versions (see `versions.json`). The helper script checks the versions of installed software and reports an error if they don't match the ones specified in `versions.json`. There are flags that allow to bypass these checks:

```
python3 build-system/Make/Make.py --overrideBazelVersion build ... # Don't check the version of Bazel
python3 build-system/Make/Make.py --overrideXcodeVersion build ... # Don't check the version of Xcode
```
