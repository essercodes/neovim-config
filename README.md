
For tree-sitter
```sh
brew install rust
cargo install --locked tree-sitter-cli
```

Create a python venv for jupyter when python is installed with brew
```sh
python3 -m venv /path/to/create/
source /path/to/create/bin/activate
pip3 install jupyterlab
deactivate
```

Create anaconda environment
```sh
conda create --prefix ./.venv
conda activate ./.venv
conda install -c conda-forge jupyterlab pandas matplotlib
```

Install Jupytext for Jupyter Notebooks
```
brew install jupytext
```

SQL embedded in strings (.py, .js, .jsx, .ts, .tsx) is detected automatically and linted by sqruff.
In TypeScript/JavaScript it must be an uppercase statement (`SELECT ... FROM`, `INSERT INTO`, `UPDATE ... SET`, `DELETE FROM`, `WITH ... AS (`, `CREATE ... TABLE/INDEX`, `ALTER TABLE`, `DROP TABLE`)
```ts
env.DB.prepare(`SELECT id FROM users WHERE id = ?`);
```
Python strings starting with any SQL keyword (any case) are detected.

Set the SQL dialect per project with a `.sqruff` file in the project root (default is ansi)
```ini
[sqruff]
dialect = sqlite
exclude_rules = LT05
```
```ini
[sqruff]
dialect = postgres
exclude_rules = LT05
```
List available dialects with `sqruff dialects`. For Postgres syntax errors, also add a `postgres-language-server.jsonc` to the project root.
