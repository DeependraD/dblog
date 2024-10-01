---
title: Memorize the date? Don't need to, use lubridate
author: Deependra Dhakal
date: '2018-10-17'
slug: memorize-the-date-don-t-need-to-use-lubridate
categories: ["R"]
tags: ["R", "Dates"]
header:
  caption: 'Source: http://www.personal.psu.edu/afr3/blogs/siowfa13/2013/10/how-are-we-so-forgetful.html'
---



# My sufferance

Time and again, I've suffered due to my humanistic limitations of memorizing things promptly. I **suck** at remembering stuffs, dates particularly. So, In this blog trip (Oh! this is a trip btw, because I don't forsee myself surpassing my memory limitations any sooner than death), I will be stating if not rambing on some lifesaving tricks of picking up pieces of your faulty brain. 

# The balm

I'm getting into the details of using base R's `date()` and date related functions. At this time, It's might seem relevent to have some understanding of "POSIXlt" and "POSIXct" object classes. But most often these never interfere unless you have a good -- not expecting perfect -- conscience of how you recorded your dates and what you eventually intent to achieve from it. Anyway, for a quick reference, here I've quoted the R's documentation on `?DateTimeClasses`:

> There are two basic classes of date/times. Class "POSIXct" represents the (signed) number of seconds since the beginning of 1970 (in the UTC time zone) as a numeric vector. Class "POSIXlt" is a named list of vectors representing
> 
> sec;
> 0-61: seconds.
> 
> min;
> 0-59: minutes.
> 
> hour;
> 0-23: hours.
> 
> mday;
> 1-31: day of the month
> 
> mon;
> 0-11: months after the first of the year.
> 
> year;
> years since 1900.
> 
> wday;
> 0-6 day of the week, starting on Sunday.
> 
> yday;
> 0-365: day of the year.
> 
> isdst;
> Daylight Saving Time flag. Positive if in force, zero if not, negative if unknown.
> 
> zone;
> (Optional.) The abbreviation for the time zone in force at that time: "" if unknown (but "" might also be used for UTC).
> 
> gmtoff;
> (Optional.) The offset in seconds from GMT: positive values are East of the meridian. Usually NA if unknown, but 0 could mean unknown.
> 
> (The last two components are not present for times in UTC and are platform-dependent: they are supported on platforms based on BSD or glibc (including Linux and macOS) and those using the tzcode implementation shipped with R (including Windows). But they are not necessarily set.). Note that the internal list structure is somewhat hidden, as many methods (including length(x), print() and str) apply to the abstract date-time vector, as for "POSIXct". As from R 3.5.0, one can extract and replace single components via [ indexing with two indices (see the examples). The classes correspond to the POSIX/C99 constructs of 'calendar time' (the time_t data type) and 'local time' (or broken-down time, the struct tm data type), from which they also inherit their names. The components of "POSIXlt" are integer vectors, except sec and zone.
> 
> "POSIXct" is more convenient for including in data frames, and "POSIXlt" is closer to human-readable forms. A virtual class "POSIXt" exists from which both of the classes inherit: it is used to allow operations such as subtraction to mix the two classes.
> 
> Components wday and yday of "POSIXlt" are for information, and are not used in the conversion to calendar time. However, isdst is needed to distinguish times at the end of DST: typically 1am to 2am occurs twice, first in DST and then in standard time. At all other times isdst can be deduced from the first six values, but the behaviour if it is set incorrectly is platform-dependent.
> 
> Logical comparisons and some arithmetic operations are available for both classes. One can add or subtract a number of seconds from a date-time object, but not add two date-time objects. Subtraction of two date-time objects is equivalent to using difftime. Be aware that "POSIXlt" objects will be interpreted as being in the current time zone for these operations unless a time zone has been specified.
>
> "POSIXlt" objects will often have an attribute "tzone", a character vector of length 3 giving the time zone name from the TZ environment variable and the names of the base time zone and the alternate (daylight-saving) time zone. Sometimes this may just be of length one, giving the time zone name.
> 
> "POSIXct" objects may also have an attribute "tzone", a character vector of length one. If set to a non-empty value, it will determine how the object is converted to class "POSIXlt" and in particular how it is printed. This is usually desirable, but if you want to specify an object in a particular time zone but to be printed in the current time zone you may want to remove the "tzone" attribute (e.g., by c(x)).
> 
> Unfortunately, the conversion is complicated by the operation of time zones and leap seconds (according to this version of R's data, 27 days have been 86401 seconds long so far, the last being on (actually, immediately before) 2017-01-01: the times of the extra seconds are in the object .leap.seconds). The details of this are entrusted to the OS services where possible. It seems that some rare systems used to use leap seconds, but all known current platforms ignore them (as required by POSIX). This is detected and corrected for at build time, so "POSIXct" times used by R do not include leap seconds on any platform.
> 
> Using `c` on "POSIXlt" objects converts them to the current time zone, and on "POSIXct" objects drops any "tzone" attributes (even if they are all marked with the same time zone).
> 
> A few times have specific issues. First, the leap seconds are ignored, and real times such as "2005-12-31 23:59:60" are (probably) treated as the next second. However, they will never be generated by R, and are unlikely to arise as input. Second, on some OSes there is a problem in the POSIX/C99 standard with "1969-12-31 23:59:59 UTC", which is -1 in calendar time and that value is on those OSes also used as an error code. Thus as.POSIXct("1969-12-31 23:59:59", format = "%Y-%m-%d %H:%M:%S", tz = "UTC") may give NA, and hence as.POSIXct("1969-12-31 23:59:59", tz = "UTC") will give "1969-12-31 23:59:00". Other OSes (including the code used by R on Windows) report errors separately and so are able to handle that time as valid.

For some trivial reasons, and that includes things such as maintaining your sanity, I do not recommend going to depths about the representation of date time in R. But if you're already too headstrong to heed my caution, seeing this [video](https://www.youtube.com/watch?v=-5wpm-gesOY) might change your mindset.

Two functions: `strptime()` and `strftime()`, are the workhorse of making conversion back and forth between the class '"POSIXlt"' and character vectors.

- `strptime()` outputs to class '"POSIXlt"'.
- `strftime()` outputs to character class.
- Simply, One is "to" and one is "from".

Suppose you have today's date and current time: Wednesday, Oct 17, 2018, 9:00 AM. Let's start with formatting this character to represent date time using `strptime()`. BTW, you can call `date()` to display current datetime, and as of now in my system, it prints Mon Sep 30 12:41:19 2024.


```
##        Wednesday, Oct 17, 2018 Wed, October 17, 2018, 9:00 AM 
##                    "character"                    "character"
```

```
## [1] "2018-10-17 +0545"
```

```
## [1] "2018-10-17 09:00:00 +0545"
```

```
## [1] "2018-10-17 09:00:00 +0545"
```

If you're not sure (And I can attest, NOBODY is!), how to express timezone (tz) use the function `Sys.timezone()`. The default formating of datetime on any system (output of `date()`) is locale specific, however. You can test what locale is currently set on your system using `Sys.getlocale()` function. Besides, locale could be set using various valid locale types (A character string; See `?locales` for more details). 

If anything further bugs for correctly formatting character vector to datetime, the documentation on `?strptime` is pretty thorough and example-rich.

To soothen things a bit, if you haven't already heard of lubridate package, get your a** of this rant and spend some time researching about it. Below, I point to a helper function, available in lubridate, that enables you to quickly format available character vector to _Date_ object.


```
## [1] "2018-10-17"
```

```
## [1] "2018-10-17"
```

```
## [1] "2018-10-17"
```

```
## [1] "2018-10-17"
```

The arithmetics of date could be bewildering sometimes, but to ease this often necessary burden, Below I show some example scenarios using lubridate helpers.


```
## Time difference of 637 days
```

```
## [1] "2018-09-29 12:00:00 UTC"
```

```
## [1] "2017-01-18 08:27:00 UTC"
```

## Duration and period

Duration is the absolute representation of time difference, while period signifies the relative difference.

> Duration displays as the number of seconds in a time span. Units larger than weeks are not used due to their variablity.

An example use case of duration is to express age of a person or likewise, till the current date. Beware, the time format display of a system is locale dependent.


```
## [1] "1001980800s (~31.75 years)"
```

```
## [1] 31.8
```


