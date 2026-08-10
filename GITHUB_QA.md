# GitHub QA

The repository includes a GitHub Actions workflow at `.github/workflows/tests.yml`.

It starts MySQL 8, installs Composer dependencies, creates `.env`, runs
`php artisan migrate:fresh --seed`, runs the Laravel test suite, boots the
application, and lints PHP files.

No production credentials are stored in the workflow.
