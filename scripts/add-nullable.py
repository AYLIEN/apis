from yaml import load, dump
import sys

if len(sys.argv) < 3:
    print("""add-nullable.py <input_file> <output_file>

Example:
add-nullable.py aylien/v1/news/api.yaml merged.yaml

Please run `speccy resolve` on the result to make sure the file is linted properly.""")
    sys.exit(0)

s = open(sys.argv[1])
output = sys.argv[2]
definition = load(s)

parameters = list(definition['components']['parameters'].values())

for value in definition['paths'].values():
    parameters += value.get('get', {}).get('parameters', [])

for value in parameters:
    if not value.get('required', False) and not value.get('$ref', False):
        value['schema'] = value.get('schema', {})
        value['schema']['nullable'] = True

out = open(output, 'w')
dump(definition, out)
