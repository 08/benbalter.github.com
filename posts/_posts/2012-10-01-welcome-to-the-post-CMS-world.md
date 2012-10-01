---
title: "Title of the post"
description: "SEO friendly description"
author: "Benjamion J. Balter"
layout: post
comments: true
category: Technology
tags: WordPress, Jekyll, GitHub, benchmarking, benchmarks
published: false
---

You may notice things are bit snappier around here these days, having [recently converted](https://github.com/benbalter/wordpress-to-jekyll-exporter) the site from WordPress, to [Jekyll](https://github.com/mojombo/jekyll).

Jekyll is a blog-aware static site generator, the move to which, was primarily motivated by a desire to embrace the brave new, [post-CMS world](http://developmentseed.org/blog/2012/07/27/build-cms-free-websites/) we find ourselves in. While WordPress is great, [130 outages over the past six months (totalling more than a day's worth of downtime)](http://cl.ly/image/1M420a152e1z), left a bit to be desired in terms of hosting. 





### Homepage

Command: `siege -c 20 -t 30S -b ben.balter.com`

The first test was to benchmark the homepage, the most heavily trafficed page on the site. Given 30 seconds of continuous traffic from 20 concurrent users, Bluehost was able to serve a meager 40 users. AWS managed an impressive 2000 users during that same time period (a 50x performance improvement), and did so twice as fast. Enter Jekyll with more than 2600 users (65x increase), responding on average to each in less than a quarter of a second.

#### Shared Hosting (Bluehost)

	Transactions:		          40 hits
	Availability:		      100.00 %
	Elapsed time:		       29.54 secs
	Data transferred:	        0.68 MB
	Response time:		        0.57 secs
	Transaction rate:	        1.35 trans/sec
	Throughput:		        0.02 MB/sec
	Concurrency:		        0.78
	Successful transactions:          40
	Failed transactions:	           0
	Longest transaction:	        0.71
	Shortest transaction:	        0.47

#### Varnish + Microcache + Page Cache + Object Cache (AWS)

	Transactions:		        1954 hits
	Availability:		      100.00 %
	Elapsed time:		       29.39 secs
	Data transferred:	       13.63 MB
	Response time:		        0.30 secs
	Transaction rate:	       66.49 trans/sec
	Throughput:		        0.46 MB/sec
	Concurrency:		       19.80
	Successful transactions:        1954
	Failed transactions:	           0
	Longest transaction:	        0.92
	Shortest transaction:	        0.06

#### Github Pages

	Transactions:		        2629 hits
	Availability:		      100.00 %
	Elapsed time:		       29.42 secs
	Data transferred:	        2.71 MB
	Response time:		        0.22 secs
	Transaction rate:	       89.36 trans/sec
	Throughput:		        0.09 MB/sec
	Concurrency:		       19.86
	Successful transactions:        2629
	Failed transactions:	           0
	Longest transaction:	        1.38
	Shortest transaction:	        0.06
	
### 404s

Command: `siege -c 20 -t 30S -b ben.balter.com/aaaaaaa/`

The true challenge comes in not from serving a static front page (which is presumably cached by WordPress after the first request), but in what happens when it has to reach into the database to retrieve content, for example, when processing a page that doesn't exist.[^1]

#### Shared Hosting (Bluehost)

	Transactions:		          30 hits
	Availability:		       21.43 %
	Elapsed time:		       29.58 secs
	Data transferred:	        0.19 MB
	Response time:		       14.93 secs
	Transaction rate:	        1.01 trans/sec
	Throughput:		        0.01 MB/sec
	Concurrency:		       15.14
	Successful transactions:           0
	Failed transactions:	         110
	Longest transaction:	       22.88
	Shortest transaction:	        0.00

#### Varnish + Microcache + Page Cache + Object Cache (AWS)

	Transactions:		        1567 hits
	Availability:		      100.00 %
	Elapsed time:		       29.13 secs
	Data transferred:	       14.71 MB
	Response time:		        0.37 secs
	Transaction rate:	       53.79 trans/sec
	Throughput:		        0.50 MB/sec
	Concurrency:		       19.83
	Successful transactions:           0
	Failed transactions:	           0
	Longest transaction:	        1.13
	Shortest transaction:	        0.00

#### Github Pages

	Transactions:		        2373 hits
	Availability:		      100.00 %
	Elapsed time:		       29.82 secs
	Data transferred:	       10.48 MB
	Response time:		        0.25 secs
	Transaction rate:	       79.58 trans/sec
	Throughput:		        0.35 MB/sec
	Concurrency:		       19.92
	Successful transactions:           0
	Failed transactions:	           0
	Longest transaction:	        1.42
	Shortest transaction:	        0.00
    
[^1]: Requesting a page that doesn't exist will require WordPress to run multiple database queries to attempt to find the page, a request that would most likely not be cached in the event that the 404 was sent in error.
