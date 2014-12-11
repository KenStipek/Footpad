Footpad
=======

Footpad is a gem for rack based systems to help produce custom [Geckoboard](https://developer.geckoboard.com) ready data. With it you can easily take a piece of data, like a number, and have it put in the correct JSON container for a cutom Geckoboard widget to consume.

### Example
```
data = '123'
number_and_secondary_stat(data)
=> 
{
  "item": [
    {
      "value": 123
    }
  ]
}
```

Footpad currently supports [number and secondary stat](https://developer.geckoboard.com/#number-and-secondary-stat]), [leaderboards](https://developer.geckoboard.com/#leaderboard), and [line charts](https://developer.geckoboard.com/#line-chart). More methods are coming soon.

## Installation
You can install the gem directly to your system:

`gem install footpad`

or add it to your gemfile if you are using one.

`gem footpad`

Within the module or class you are calling Footpad's methods, include the module:

`include Footpad`

If you are using this within a Rails project, just use the above line in the controller you are using the methods.

## Instructions

After you have added Footpad to you application you can expose data in these formats.

#### Number and Secondary Stat

The first value is required, and the value that will be the primary stat. You can add any of the additional parameters by simply including it after the first.

```
primary_stat = 1000
secondary_info = 'is a lot'

number_and_secondary_stat(primary_stat, text: secondary_info)
```

Will result in

```
{
  "item": [
    {
      "value": 1000,
      "text": "is a lot"
    }
  ]
}
```

Look at the docs to see all the [paramater options](https://developer.geckoboard.com/#parameters-18).

#### Leaderboard

The first provided value is an array or arrays with two or three pieces of data, this will create the label, value, and rank arrows. The order that you list them here will be the order that they display on the Geckoboard element.

```
leaders = [
  ['Tom', 12, 2],
  ['Jon', 10, 1],
  ['Paul', 8, 3]
]
leaderboard(leaders)
```
Will result in
```
{
  "items": [
    {
      "label": "Tom",
      "value": 10,
      "previous_rank": 2
    },
    {
      "label": "Jon",
      "value": 10,
      "previous_rank": 1
    },
    {
      "label": "Paul",
      "value": 8,
      "previous_rank": 3
    }
  ]
}
```

Check out the [paramater options here](https://developer.geckoboard.com/#parameters-8).

#### Line Chart
Line charts are pretty simple, with this you simply provide an array of values to be displayed.

```
values = [15, 23, 56, 67]
linechart(values)
```

Which will result in

```
{
  "item" : [
    15, 23, 56, 67
  ]
}
```

Where having method really helps is with it's additional settings, check this out:

```
MONTHS = Date::MONTHNAMES.compact.map {|m| m[0..2] }
values = [15, 23, 56, 67]
linechart(value, axisx: MONTHS, axisy: [value.min, value.max], color: '#ff00aa')
```

Results in

```
{
  "item" : [
    15, 23, 56, 67
  ],
  "settings" : {
    "axisx" : [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC
    ],
    "axisy" : [15, 67],
    "color" : "#ff00aa"
  }
}
```

Check out the [additional params here](https://developer.geckoboard.com/#parameters-10).
