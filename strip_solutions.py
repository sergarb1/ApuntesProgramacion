import re, os

docs_dir = "src/content/docs"

pat1 = re.compile(r'\*\*Solución:\*\*\s*\n```java\n.*?\n```\s*\n?', re.DOTALL)
pat2 = re.compile(r'<details>.*?</details>\s*\n?', re.DOTALL)

total = 0
for root, dirs, files in os.walk(docs_dir):
    for fname in files:
        if fname.endswith("-resuelto.md") and not fname.endswith("-inicial-resuelto.md"):
            path = os.path.join(root, fname)
            with open(path, 'r', encoding='utf-8') as f:
                content = f.read()
            new = pat1.sub('', content)
            new = pat2.sub('', new)
            if new != content:
                with open(path, 'w', encoding='utf-8') as f:
                    f.write(new)
                rel = os.path.relpath(path, docs_dir)
                print(f"OK {rel}")
                total += 1
            else:
                rel = os.path.relpath(path, docs_dir)
                print(f".. {rel}")

print(f"\nModificados: {total} archivos")
