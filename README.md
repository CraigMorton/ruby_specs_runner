# ruby_specs_runner

Ruby script to run ruby tests &amp; colourise output. Test files must be in directory named either `specs/` or `tests/`. The script will run all `.rb` files within the `specs/` (or `tests/`) directory.

You can run this script from either the directory above the `specs/` (or `tests/`) directory, or from within the `specs/`( or `tests/`) directory itself.

To install the script in your home directory and set up and alias in your `.zshrc` to run it from anywhere, run these three commands in your terminal:

```bash
curl https://raw.githubusercontent.com/CraigMorton/ruby_specs_runner/master/run_specs.rb >> ~/ruby_specs_runner.rb
echo "alias rubytest='ruby ~/ruby_specs_runner.rb'" >> ~/.zshrc
source ~/.zshrc
```

First command downloads the script from this github repo.
Second command creates an alias in your `.zshrc`
Third command reloads your `.zshrc` so you can start using the alias in the current terminal tab.

If you use a different shell (I'm assuming most people who want to use this are codeclan students so I know they have zsh) obviously you'll have to replace `~/.zshrc` in the second and third commands with your own shell configuration file.

Output:

![after](https://raw.githubusercontent.com/CraigMorton/ruby_specs_runner/master/img/after.png)

Before, using a simple bash script to run each spec file in turn:

![before](https://raw.githubusercontent.com/CraigMorton/ruby_specs_runner/master/img/before.png)
