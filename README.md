
For tree-sitter
```sh
brew install rust
cargo install --locked tree-sitter-cli
```

For snack images in jupyter
```sh
brew install ghostscript imagemagick
```

Create a python venv for jupyter when python is installed with brew
```sh
python3 -m venv /path/to/create/
source /path/to/create/bin/activate
pip3 install jupyterlab
deactivate
```

```sh
brew install hashicorp/tap/terraform-ls
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
