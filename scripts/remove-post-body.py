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
        value['post']['requestBody'] = {
            'required': True,
            'description': '/stories body schema to perform an advanced search with logical operators and nested objects.\n',
            'content': {
                'application/json': {
                    'schema': {
                        'type': 'object'
                    }
                }
            }
        }

for value in ['Logical', 'Logicals', 'Parameter', 'Query', 'NestedEntity']:
    definition['components']['schemas'].pop(value, None)

definition['components'].pop('requestBodies', None)

dump(definition, output)
