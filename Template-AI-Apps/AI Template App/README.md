# AI Template App

## Windows

1. Install PsychoPy, or install Python 3 and make sure it is available through
   the `py` launcher or `python` on `PATH`.
2. From `Template-AI-Apps`, run `install_deps.bat`.
3. Run `run_app.bat` in this folder.

The installer and launcher use the same interpreter, in this order:

1. `PSYCHOPY_PYTHON`, if set to an existing interpreter path.
2. `Template-AI-Apps\PsychoPy\python.exe`.
3. `Template-AI-Apps\.venv\Scripts\python.exe`.
4. The standard PsychoPy locations under Program Files or the user's local
   Programs folder.
5. The Python 3 launcher (`py -3`), then `python` on `PATH` (excluding the
   Microsoft Store execution alias).

If PsychoPy is installed elsewhere, set `PSYCHOPY_PYTHON` to its `python.exe`
path before running either batch file. For example, in Command Prompt:

```bat
set PSYCHOPY_PYTHON=C:\path\to\PsychoPy\python.exe
```

The app also needs the Tobii SDK files in the sibling `x3-120 SDK\64` folder.
The launcher does not connect to an eye tracker unless the app is run on a
compatible workstation with the required hardware and SDK.
