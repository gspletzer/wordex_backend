# Wordex

Wordle, but in Elixir.

## How to Contribute

1. Clone the repo to your local machine.
2. Create a new branch using the following naming structure: `username-task`. (Ex. `gspletzer-update-readme`)
3. Commit and push changes with short, readable message. (Ex. `chore: added instructions to the readme`). Find more information on conventional commits [here](https://www.conventionalcommits.org/en/v1.0.0/).
4. Open a PR on Github once your changes are tested and ready for review.
5. PR can be merged to `master` following approval from a fellow contributor.

## Testing

A key to good development is good testing, so be sure to add new tests for new features and update relevant tests when modifying existing code.

The [mix_test_interactive](https://github.com/randycoulman/mix_test_interactive) dependency has been added to the repository. This allows tests to run automatically with each save while you work. You can also use it to isolate your testing to for a specific file. If you wish to use this, just run `mix deps.get` once you are in your `wordex` directory.
