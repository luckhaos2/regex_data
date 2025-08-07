import re
text = 0000-00-00
regular_expresions = r"^\d{4}--d{2}--\d{2}$"
regex = re.compile(text)
regex.search(regular_expresions)