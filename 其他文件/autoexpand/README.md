# autoexpand

`generate_expand.py` reads a `compile_commands.json`-style file, selects one entry by index, injects `-fdump-rtl-expand`, runs the compile command in the entry's `directory`, then collects the generated `*.expand` into `autoexpand/expand/`.

To change which command is executed, edit constants at the top of:
- `autoexpand/generate_expand.py`

Run:
- `python3 autoexpand/generate_expand.py`
