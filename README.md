# mongoid-nested-embedded-document-issue
This repo to show an issue of mongoid nested embedded document. see https://jira.mongodb.org/browse/MONGOID-4476

```
$ rspec spec/
D, [2017-09-12T15:52:20.583106 #84769] DEBUG -- : MONGODB | Topology type 'unknown' initializing.
D, [2017-09-12T15:52:20.583253 #84769] DEBUG -- : MONGODB | Server localhost:27017 initializing.
D, [2017-09-12T15:52:20.587508 #84769] DEBUG -- : MONGODB | Topology type 'unknown' changed to type 'single'.
D, [2017-09-12T15:52:20.587650 #84769] DEBUG -- : MONGODB | Server description for localhost:27017 changed from 'unknown' to 'standalone'.
D, [2017-09-12T15:52:20.587708 #84769] DEBUG -- : MONGODB | There was a change in the members of the 'single' topology.
D, [2017-09-12T15:52:20.588495 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.insert | STARTED | {"insert"=>"as", "documents"=>[{"_id"=>BSON::ObjectId('59b792340dd8164b21df857a'), "bs"=>[{"_id"=>BSON::ObjectId('59b792340dd8164b21df857b'), "cs"=>[{"_id"=>BSON::ObjectId('59b792340dd8164b21df857c'), "api_code"=>"Default Api Code C"}], "api_code"=>"D...
D, [2017-09-12T15:52:20.591339 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.insert | SUCCEEDED | 0.002739s
D, [2017-09-12T15:52:20.593029 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.find | STARTED | {"find"=>"as", "filter"=>{"_id"=>BSON::ObjectId('59b792340dd8164b21df857a')}}
D, [2017-09-12T15:52:20.593852 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.find | SUCCEEDED | 0.000781s
.D, [2017-09-12T15:52:20.595382 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.insert | STARTED | {"insert"=>"as", "documents"=>[{"_id"=>BSON::ObjectId('59b792340dd8164b21df857d')}], "ordered"=>true}
D, [2017-09-12T15:52:20.596067 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.insert | SUCCEEDED | 0.00064s
D, [2017-09-12T15:52:20.597553 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.update | STARTED | {"update"=>"as", "updates"=>[{"q"=>{"_id"=>BSON::ObjectId('59b792340dd8164b21df857d')}, "u"=>{"$set"=>{"bs"=>[{"_id"=>BSON::ObjectId('59b792340dd8164b21df857e'), "cs"=>[{"_id"=>BSON::ObjectId('59b792340dd8164b21df857f')}], "api_code"=>"Default Api Cod...
D, [2017-09-12T15:52:20.598247 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.update | SUCCEEDED | 0.0006349999999999999s
D, [2017-09-12T15:52:20.598726 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.find | STARTED | {"find"=>"as", "filter"=>{"_id"=>BSON::ObjectId('59b792340dd8164b21df857d')}}
D, [2017-09-12T15:52:20.599278 #84769] DEBUG -- : MONGODB | localhost:27017 | spike_test.find | SUCCEEDED | 0.0005059999999999999s
F

Failures:

  1) A sets api code when update
     Failure/Error: expect(reloaded.bs.first.cs.first.api_code).to eq 'Default Api Code C'    # expected: "Default Api Code C", got: nil

       expected: "Default Api Code C"
            got: nil

       (compared using ==)
     # ./spec/a_spec.rb:30:in `block (2 levels) in <top (required)>'

Finished in 0.03686 seconds (files took 0.58672 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/a_spec.rb:22 # A sets api code when update
```
