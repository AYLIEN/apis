from yaml import load, dump
import sys

if len(sys.argv) < 3:
    print("""remove-post-body.py <input_file> <output_file>

Example:
remove-post-body.py aylien/v1/news/api.yaml temp-no-post.yaml

Used to remove post `requestBody` definition from all endpoints to ensure
Node and Go SDKs generate properly.""")
    sys.exit(0)

s = open(sys.argv[1])
output = open(sys.argv[2], 'w')
definition = load(s)

parameters = list(definition['components']['parameters'].values())

for value in definition['paths'].values():
    if 'post' in value and 'requestBody' in value['post']:
        value['post'].pop('requestBody', None)

dump(definition, output)
