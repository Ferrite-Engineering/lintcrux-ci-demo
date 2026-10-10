# LintCrux CI demo

A minimal repository showing [LintCrux](https://lintcrux.app) gating RTL lint in GitHub Actions.

- `rtl/alu.sv` is a small ALU with deliberate lint findings, from the LintCrux getting-started example.
- `rtl/soc_alu.lintcrux` is the LintCrux project.
- `rtl/.lintcrux-baseline.json` is the committed baseline. It records the findings that already exist, so they don't fail the build.
- `.github/workflows/lint.yml` runs the LintCrux CLI with `--fail-on-new-violations` and uploads the results to GitHub code scanning as SARIF.

A pull request that adds a new finding fails the check, and the finding appears as an annotation on the changed line. Findings already in the baseline don't fail anything.

The workflow installs Verilator from Homebrew rather than apt, so CI runs the same Verilator release the baseline was set with: a baseline matches findings partly by their message text.

See the [CI cookbook](https://docs.lintcrux.app/cookbook/ci-integration/) for the full exit-code contract and the GitLab equivalent.

Licensed under the Apache License 2.0; see [LICENSE](LICENSE).
