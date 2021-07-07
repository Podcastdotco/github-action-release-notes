# github-action-release-notes
Get git log from specify git tag to the present

# Usage

See [action.yml](action.yml)

Basic:
```yaml
steps:
- name: Checkout Code
  uses: actions/checkout@master

- name: Generate Release Notes
  id: relase_notes
  uses: Podcastdotco/github-action-relase-notes@mater

- name: Get the log
  run: echo "Realse log ${{ steps.relase_notes.outputs.log }}"
```
