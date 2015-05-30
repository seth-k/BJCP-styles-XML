import xml.etree.ElementTree as ET
import re

		
def normalize_whitespace(str):
	import re
	str = str.strip()
	str = re.sub(r'\s+', ' ', str)
	return str
	
	
input_filename = "styleguide-2015-with-intros.xml"
output_filename = "styleguide-2015-min.xml"
tree = ET.parse(input_filename)

for e in tree.iter():
	if e.text is not None:
		e.text = normalize_whitespace(e.text)
	if e.tail is not None:
		e.tail = normalize_whitespace(e.tail)
				
tree.write(output_filename)