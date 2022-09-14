import tempfile

temp = tempfile.TemporaryFile("w+")
temp.write("hello")
temp.seek(0)
line = temp.read()
temp.seek(0)
temp.truncate()
print(line)
temp.write("world!")
temp.seek(0)
line = temp.read()
print(f"l: {line}")
temp.seek(0)
