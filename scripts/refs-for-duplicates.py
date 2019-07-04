from yaml import load, dump
import hashlib
import sys
from urllib import parse

if len(sys.argv) < 3:
    print("""refs-for-duplicates.py <input_file> <output_file>

Example:
refs-for-duplicates.py aylien/v1/news/api.yaml merged.yaml

Please run `speccy resolve` on the result to make sure the file is linted properly.""")
    sys.exit(0)

s = open(sys.argv[1])
output = sys.argv[2]
definition = load(s)

paths = definition['paths']

params_dict = {}
responses_dict = {}

for (key, value) in paths.items():
    for (method, v) in value.items():
        for (i, param) in enumerate(v['parameters']):
            hashed = hashlib.md5(dump(param).encode('utf-8')).hexdigest()
            if hashed in params_dict:
                params_dict[hashed]['items'].append(['paths', key, method, 'parameters', i])
            else:
                params_dict[hashed] = {
                    'items': [['paths', key, method, 'parameters', i]],
                    'definition': param
                }


for (key, value) in params_dict.items():
    count = len(value['items'])
    if count <= 1:
        continue

    name = parse.quote(value['definition']['name'].replace('!', 'not').replace('.', '_').replace('[]', ''))
    definition['components']['parameters'][name] = value['definition']

    for item in value['items']:
        d = definition
        last_key = item[-1]

        for k in item[0:-1]:
            d = d[k]

        d[last_key] = {
            '$ref': f'#/components/parameters/{name}'
        }

out = open(output, 'w')
dump(definition, out)
