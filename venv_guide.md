# Make python venv:
1. **Create the environment**:
    Navigate to your project folder (or create a new one):
   ```bash
   mkdir my_project
   cd my_project
   ```
   `python3 -m venv venv`
2. **Activate the environment**:
   * macOS/Linux: `source venv/bin/activate`
3. **Install packages**:
   `pip install package_name`
   Update packages:
    `python3 -m pip install --user --upgrade pip setuptools wheel`
4. **Save packages to `requirements.txt`**:
   `pip freeze > requirements.txt`
5. **Install from `requirements.txt`**:
   `pip install -r requirements.txt`
6. **Deactivate**:
   `deactivate`