# Polytomic Terraform Sync

The `polytomic/terraform-sync` action exports Polytomic resources to Terraform
HCL.

See https://github.com/polytomic/terraform-sync-template for a template
repository that configures the action and uses it to create pull requests for
changes.

## Usage

This action may be used in a Github workflow as follows:

```yaml
on:
  schedule:
    # Runs "At every 10th minute." (https://crontab.guru/#*/10_*_*_*_*)
    - cron: "*/10 * * * *"

env:
  POLYTOMIC_API_KEY: ${{ secrets.POLYTOMIC_API_KEY }}

jobs:
  pull-request:
    environment: exporter
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Create output directory
        run: |
          mkdir -p terraform
      - name: Polytomic Terraform Sync
        uses: polytomic/terraform-export-gh-action@v0.1.0
        with:
          api_key: ${{ env.POLYTOMIC_API_KEY }}
      - name: Commit changes
        uses: EndBug/add-and-commit@v9
```

The following arguments are supported:

- `api_key`: The Polytomic API key to use when exporting resources (required).
- `output_dir`: The output directly to write to; defaults to `terraform`.
- `url`: The URL of the Polytomic deployment to sync from; defaults to
  `https://app.polytomic.com`.
