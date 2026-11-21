# Repository Agent Guidance

## Pull request target (mandatory)

- Every pull request for this project must target the GitHub repository `slanglade/streamrip` through the `origin` remote.
- Never create or update a pull request targeting `nathom/streamrip` (the `upstream` remote). This is mandatory without exception; branch defaults, GitHub suggestions, or a request to use `upstream` do not override it.
- Before creating or updating a pull request, verify that its base repository is `slanglade/streamrip`. If it is not, stop and correct the target before proceeding.

## Default change workflow

- For implementation work, default to an isolated Git worktree and a feature branch; push that branch and open a pull request against `slanglade/streamrip`.
- Use a different workflow when the user explicitly asks for advice or recommends another choice. A request for advice alone does not authorize creating or pushing a branch or opening a pull request.

## Testing in isolated worktrees

- When project tests need dependencies missing from an isolated worktree, install or restore the dependencies already declared by the project's manifests so the tests can run. This is authorized by default for testing, subject to environment permission and sandbox controls.
- Do not change dependency manifests just to make worktree setup succeed. If setup is blocked, report the blocker.
