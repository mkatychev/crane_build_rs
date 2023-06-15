This repo demonstrates issues with upstream `build.rs` deps:
```
$ nix build
warning: creating lock file '/Users/mkatychev/Documents/rust/crane_build_rs/flake.lock'
warning: Git tree '/Users/mkatychev/Documents/rust/crane_build_rs' is dirty
error: builder for '/nix/store/d6754rkk59ciazp92w46b8jxp6j1xkd0-my-package-deps-0.1.0.drv' failed with exit code 101;
       last 10 log lines:
       > ++ command cargo check --release --package my-package
       >    Compiling git-package v0.1.0 (https://github.com/mkatychev/crane_build_rs?rev=02b264f#02b264f0)
       >    Compiling my-package v0.1.0 (/private/tmp/nix-build-my-package-deps-0.1.0.drv-0/source/my-package)
       > error: failed to run custom build command for `git-package v0.1.0 (https://github.com/mkatychev/crane_build_rs?rev=02b264f#02b264f0)`
       >
       > Caused by:
       >   process didn't exit successfully: `/private/tmp/nix-build-my-package-deps-0.1.0.drv-0/source/target/release/build/git-package-51b31c9995950ab1/build-script-build` (exit status: 1)
       >   --- stderr
       >   Error: Os { code: 13, kind: PermissionDenied, message: "Permission denied" }
       > warning: build failed, waiting for other jobs to finish...
       For full logs, run 'nix log /nix/store/d6754rkk59ciazp92w46b8jxp6j1xkd0-my-package-deps-0.1.0.drv'.
error: 1 dependencies of derivation '/nix/store/3zfjmmjsfm2sdxn91bivymfwnxj70x4q-my-package-0.1.0.drv' failed to build
```
