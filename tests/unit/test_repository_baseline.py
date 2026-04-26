from pathlib import Path


def test_required_template_files_exist() -> None:
    required_files = [
        "AGENTS.md",
        "SECURITY.md",
        "README.md",
        "pyproject.toml",
        ".env.example",
        ".github/workflows/ci.yml",
        ".github/workflows/codeql.yml",
        ".github/workflows/deploy-staging.yml",
        ".github/workflows/deploy-production.yml",
        ".github/dependabot.yml",
        ".github/pull_request_template.md",
        "docs/github-repository-setup.md",
        "docs/deployment-workflows.md",
        "docs/requirements.md",
        "docs/architecture.md",
        "docs/security/threat-model.md",
        "docs/security/security-requirements.md",
    ]

    for file_name in required_files:
        assert Path(file_name).is_file(), f"Missing required template file: {file_name}"