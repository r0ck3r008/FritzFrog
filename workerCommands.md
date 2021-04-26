## main.Worker
main.Worker is presumably a function that is run after key exchange is successful.
If this is the case, then it is very likely it is run as a seprate go routine.
It basically is an infinite if-else loop with seprate functions called as commands.

## Peer Algorithm related
1. main.ping __0x007f1bf0__
	- Uses to send a ping to peer
	- Updates peer status in Database if read is successful
	- Uses _main.CryptComm.Read/Write_ to send encrypted pings
2. main.getpeerstats __0x007faf90__
	- Possibly sends stats of all the peers, including the ones blacklisted and the ones that have sent blobs __to__ the nbor
	- Uses _main.*Database.GetOwned_, _main.*Database.GetDeploying_ as well as _main.*Database.GetBlacklist_
3. main.getvotestats __0x007fdf80__
	- Sends over _TargetPool_ __to__ the peer
	- Uses _main.*Database.GetTargetPool_ and _main.*Database.GetOwned_ internally
4. main.communicate __0x007f2150__
	- Possibly used to update a socket/communication method for a peer in Db
	- Has an evasion feature, returns regular errors if a check fails
5. main.getstatus __0x007f5200__
	- Possibly sends status of a particular peer __to__ nbor
6. main.putblentry __0x007fea70__
	- Add a new _blacklist_ entry to the database
	- internally uses _main.*Database.AddBLEntry_
7. main.getdb __0x007f4f20__
	- Pushes peer database __to__ nbor
	- Uses _JSON_ Encoding 
8. main.pushdb
	- Fetches peer database __from__ nbor
	- Uses _JSON_ Encoding
9. main.getdbzip
	- Pushes peer database __to__ nbor
	- Uses GZIP format
	- Uses _compress/gzip_ in std library
10. main.pushdbzip __0x007f67e0__
	- Gets peer database __from__ nbor
	- Uses GZIP format
	- Uses _compress/gzip_ in std library
11. main.getdbnotargets 
	- Possibly pushes blacklisted targets __to__ nbor
	- Uses _JSON_ encoding

## Binary related
1. main.getbin __0x007f7ed0__
	- Pushs encrypted binary data __to__ the nbor
2. main.pushbin __0x007f7910__
	- Gets encrypted binary data __from__ the nbor
3. main.sharefiles __0x007f8b60__
	- Sends a requested file __to__ the nbor
	- Possibly has certain evasion features, can send wrong error message if some condition is not met
4. main.mapblobs __0x007f8340__
	- Might send blobs and related peer info __to__ nbor
5. main.getblobstats __0x007fcf80__
	- Send statistics of owned blob __to__ nbor
	- Internally uses _main.*Database.GetOwned_
6. main.getowned __0x007f4af0__
	- Sends encrpted list of targets owned __to__ the nbor
	- Gets all the owned peers from the database using _main.*Database.GetOwned_ internally
7. main.putowned __0x007f3340__
	- Gets _owned_ target __from__ nbor
	- adds to Db using _main.*Database.AddOwned_
8. main.pushowned __0x007f3a10__
	- Gets all the owned assets __from__ the nbor
	- Uses _main.*Database.AddOwned_ in a loop internally
9. main.resetowned __0x007f4090__
	- Probably resets the attributes of an owned asset
	- Uses _main.*Database.RemoveOwned_ before _main.*Database.AddOwned_
	- Removes and re-inserts a target
10. main.getstats __0x007f9110__
	- Sends some kind of stats about the _owned_ blobs _to_ the nbor

## Target Related
1. main.gettargets __0x007f46f0__
	- Iterate over target map and return targets __to__ the peer
	- Uses _JSON_ encoding
2. main.puttargets __0x007f2450__
	- Get targets __from__ nbro
	- Internally uses _main.*Database.AddTarget_ in a loop
3. main.pushtargets __0x007f2880__
	- Receive a list of targets in _JSON_ format __from__ a nbor
	- Uses _main.*Database.AddTarget_ in loop
4. main.puttargetpool __0x007f2e10__
	- Adds a whole _targetpool_ to database as received _from_ nbor
	- Uses _JSON_ encoding
	- Uses _main.*Database.AddTPEntry_ internally
5. main.forcetargets __0x007f2b90__
	- Internally uses _main.*Database.ForceTargets_
6. main.deploystatus __0x007f5b90__
	- Most likely used to get status of deployed peers
7. main.putdeploying __0x007f36a0__
	- Gets the target info and adds to its database _from_ the nbor
	- Uses _JSON_ encoding
	- Uses _main.*Database.AddDeploying_ internally.
8. main.getdeploy __0x007f5550__
	- Uses _main.*Database.SetDeploy_ internally

## Log related
1. main.getlog __0x007f1a80__
	- Uses to write encrypted log __to__ the nbor
	- Internally uses main.GetLog
2. main.pushlog __0x007f9080__
	- Uses to get logs __from__ the nbor
3. main.Log __0x007e07f0__
	- Possibly creates a new log entry with current time

## Misc
1. main.runscript __0x007fecd0__
	- Runs a script using _os/Exec_ module
	- Command is run using _os/Exec.Command_ function
	- Uses _os/Exec.*Cmd.StdinPipe_ and _os/Exec.*Cmd.StdoutPipe_
2. main.comm\_proxy __0x007ff390__
	- Possibly used to create a new _CryptComm_ connection to a peer
	- Uses _main.NewCryptoCommFromOwned_ internally
3. main.getargs __0x007ff9b0__
	- Writes yet unknown data to nbor
