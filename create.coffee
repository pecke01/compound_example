extend = require 'node.extend'
fs = require 'fs'
restify = require 'restify'

# Create an index with mappings.
console.log 'Creating index on localhost:9200'
indexname = 'compound_demo'
index = {}
# Settings
extend(true, index, JSON.parse(fs.readFileSync('settings_t.json')))
#Mappings
extend(true, index, JSON.parse(fs.readFileSync('mappings_t.json')))


client = restify.createJsonClient { url: 'http://localhost:9200/' }

#Delete index
client.del(indexname, (err, req, res, obj) ->
	)

client.post(indexname,index, (err ,req, res, obj) ->
	if err
		console.log 'Error when creating myindex: '+err
	else
		console.log  indexname+' created successfully'
	)