# CricApi

Welcome to cric-api. The live cricket score, player statistics and fantasy scorecard API allow you to get API data anytime, 24x7 at your fingertips. It's extremely simple, easy to use - with a huge collection of examples.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'CricApi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install CricApi

## Usage

The [CricApi](http://www.cricapi.com/), Free to use, super-high bandwidth, high performance Cricket API. Targeted at Developers and Cricket lovers.


In order to use the [CricApi](http://www.cricapi.com/) endpoints, u need to have an api_key which can use generated by signing into [cricapi](http://www.cricapi.com/). For testing purpose can use test_api_key "TESTKEY0273"

There are 8 endpoints, Usage is as Follow

```ruby
    require 'CricApi'
    
    api_key = "TESTKEY0273"
    cricapi = CricApi::Request.new(api_key)
```
####cricket endpoint, Old Match API#### 

```ruby 
   
    cricapi.cricket
    # => {
  	    "ttl": 2,
  	    "v": "1",
  	    "cache": true,
  	    "data": [
    		      {
      			 "unique_id": "1122751",
      			 "description": "Mid West Rhinos 213/6 * v Mashonaland Eagles 321/10 ",
      			 "title": "Mid West Rhinos 213/6 * v Mashonaland Eagles 321/10 "
    		      }
    	    ]
    	 }
```
####schedule endpoint, Match Calender####
    	 
```ruby

    cricapi.schedule
    # => { 			
  	    "data": [
    		      {
      			 "unique_id": "will generate 1-2 days before match",
      			 "name": "India v Sri Lanka at Kolkata, 1st Test - day 1",
      		         "date": "16 November 2017"
    		      },
    		      {
      			 "unique_id": "will generate 1-2 days before match",
      			 "name": "India v Sri Lanka at Kolkata, 1st Test - day 2",
      			 "date": "17 November 2017"
    		       }
    		    ]		
    	 }    	 	    
```

####cricketScore endpoint####, 
This requires a match unique_id, which will be provide by cricket endpoint 
    	 
```ruby

    unique_id = "1034809"
    cricapi.cricketScore(unique_id)
    # => {
  	    "matchStarted": true,
  	    "team-1": "England",
  	    "team-2": "India",
  	    "cache": true,
  	    "v": "1",
  	    "ttl": 2,
  	    "provider": {
    		"source": "Various",
    		"url": "https://cricapi.com/",
    		"pubDate": "2017-11-11T06:24:19.712Z"
  	    },
	}   	 	    
```

####matches endpoint####

```ruby
    cricapi.matches
    # => {
  	    "matches": [
    			 {
      			    "unique_id": 1124063,
      			    "date": "2017-11-10T00:00:00.000Z",
      			    "team-2": "Band-e-Amir Region",
      			    "team-1": "Mis Ainak Region",
      			    "type": "First-class",
      			    "dateTimeGMT": "2017-11-07T04:30:00.000Z",
      			    "squad": true,
      			    "toss_winner_team": "Band-e-Amir Region",
      			    "matchStarted": true
    			} 
    		      ]
           }				    	 	    
```

#### playerStats endpoint, 
This requires a players pid, which will be obtained [here](http://www.cricapi.com/players/) 
    	 
```ruby

    pid = "32350"
    cricapi.playerStats(unique_id)
    # => {
  			"pid": 35320,
  			"profile": "\n\nSachin Tendulkar has been the most complete batsman of his time, the most prolific runmaker of all time, and arguably the biggest cricket icon the game has ever known. His batting was based on the purest principles: perfect balance, economy of movement, precision in stroke-making, and that intangible quality given only to geniuses - anticipation. If he didn't have a signature stroke - the upright, back-foot punch comes close - it's because he was equally proficient at each of the full range of orthodox shots (and plenty of improvised ones as well) and can pull them out at will.  \n\n",
 			"imageURL": "http://cricapi.com/playerpic/35320.jpg",
  			"battingStyle": "Right-hand bat",
  			"bowlingStyle": "Right-arm offbreak, Legbreak googly",
  			"majorTeams": "India,Asia XI,Mumbai,Mumbai Indians,Yorkshire",
  			"currentAge": "44 years 186 days",
  			"born": "April 24, 1973, Bombay (now Mumbai), Maharashtra",
  			"fullName": "Sachin Ramesh Tendulkar",
  			"name": "Sachin Tendulkar",
  			"country": "India",
  			"playingRole": "Top-order batsman"
  		}
  		 	 	    
```

#### playerFinder endpoint
This takes player name as input
    	 
```ruby

    name = "Tendulkar"
    cricapi.fantasySquad(name)
    # => 
    #Array of players in the format: 
     
    {
  		"data": [
    			  {
      				"pid": 35320,
      				"fullName": "Sachin Ramesh Tendulkar",
      				"name": "Sachin Tendulkar"
    			  }
  			]
    }		
                                              	
	  	    
```

 The remaining 2 are Fantasy API endpoints, Fantasy API are billable since they're designed to help you generate income by running Fantasy Cricket portals. Each hit is 1 credit. You get 250 credits free. Deducted from your prepaid account. 

#### fantasySummary endpoint,
This requires a match unique_id, which will be provide by cricket endpoint 
    	 
```ruby

    unique_id = "1034809"
    cricapi.fantasySummary(unique_id)
    # =>
    #Array of teams of the format: 
     {
  	    	"team": [{
			"name": "Gloucestershire",
			"players": [{ // active batsmen/bowlers/fielders only
			"pid": "298564",
			"name": "WA Tavare"
		}, ... ]
		}, {
			"name": "Leicestershire",
			"players: [...]
		}]
	 }
	 
	#Inning-wise, Player-wise array of Batting scores of the format:

	[{
		"title": "Gloucestershire 1st innings",
		"scores": [
			[{
				"pid": "298564",                  // -----------------> Use this with playerStats CricAPI for more info
				"batsman": "WA Tavare",
				"dismissal-info": "c Cosgrove b Jones",
				"R": "7",                   // -----------------> Runs
				"M": "14",                  // -----------------> Minutes Batted
				"B": "13",                  // -----------------> Balls Played
				"4s": "1",                  // -----------------> FOURs hit
				"6s": "0",                  // -----------------> SIXes hit
				"SR": "53.84"                  // -----------------> Strike Rate / 100 Balls
			}, ... ]
		]
	}, {
		"title": "Gloucestershire 2nd innings",
    	"scores": [ ... ]
	}, ...]   	
	  	    
	#Inning-wise, Player-wise array of Bowling scores of the format:
	
	[{
		"title": "Bowling",
		"scores": [
			[{
				"pid": "6903",                  // -----------------> Use this with playerStats CricAPI for more info
				"bowler": "CJ McKay",
				"O": "11",                  // -----------------> Overs bowled (decimal value)
				"M": "1",                  // -----------------> Maidens bowled
				"R": "42",                  // -----------------> Runs conceded
				"W": "1",                  // -----------------> Wickets taken
				"Econ": "3.81",                  // -----------------> Economy of runs per 6 balls
				"0s": "48"                  // -----------------> Dot balls bowled
			}, ... ]
		]
			}, {
		"title": "Bowling",
    	"scores": [ ... ]
	}, ...]
	
	#Inning-wise, Player-wise array of Fielding scores of the format:
	
	[{
		"title": "Fielding",
		"scores": [
			[{
				"pid": "6903",                  // -----------------> Use this with playerStats CricAPI for more info
				"name": "CJ McKay",
				"catch": 3,                  // -----------------> Catches
				"lbw": 4,                  // -----------------> LBWs
				"stumped": 2,                  // -----------------> Stumped
				"bowled": 0                  // -----------------> Bowled
			}, ... ]
		]
	}, {
		"title": "Fielding",
    	"scores": [ ... ]
	}, ...]
	
	 
```

#### fantasySquad endpoint.	
This requires a match unique_id, which will be provide by cricket endpoint 	
    	 	
```ruby	
	
    unique_id = "1034809"	
    cricapi.fantasySquad(unique_id)	
    # => 	
    #Array of Squad entries in the format: 		
			{
			  "squad": [
			    {
			      "name": "Ireland Women",
			      "players": [
			        {
			          "pid": 1150585,
			          "name": "Orla Prendergast"
			        },
			        {
			          "pid": 418420,
			          "name": "Laura Delany"
			        },
			        {
			          "pid": 418423,
			          "name": "Kim Garth"
					}
				}	
			  ]
			}                                    		
	  	    	
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/karthikgangadhar/CricApi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CricApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[karthikgangadhar]/CricApi/blob/master/CODE_OF_CONDUCT.md).
