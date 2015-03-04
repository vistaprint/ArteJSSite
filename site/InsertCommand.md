---
layout: main
title: InsertCommand
area: plugins
---

## Insert Command

Extends Arte.Text area to an insert function

### Usage
The insert command exposes the following public api to the Arte Text Area

####Insert
Allows you to insert any html into the current selection position while replacing any previously selected content
{% highlight javascript %}
    $(".editor").Arte.insert({
        commandValue: "content to insert"
    }; 
{% endhighlight %}
