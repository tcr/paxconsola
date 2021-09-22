# Python 3 conversion from .tmx files to .asm

from xml.parsers.expat import ParserCreate

p = ParserCreate()

# 3 handler functions
csv = ''
map_width = 0
map_height = 0
def start_element(name, attrs):
    global map_width, map_height
    # print('Start element:', name, attrs)
    if attrs.get('width'):
        map_width = int(attrs.get('width'))
    if attrs.get('width'):
        map_height = int(attrs.get('width'))
def end_element(name):
    # print('End element:', name)
    pass
def char_data(data):
    global csv
    if not data.isspace():
        csv += data

p.StartElementHandler = start_element
p.EndElementHandler = end_element
p.CharacterDataHandler = char_data

p.ParseFile(open('./level-1.tmx', 'rb'))

print('        align 16')
print('map_level_1:')
for index in [int(x) for x in csv.split(',')]:
    print(f'        dw {index - 1}')
