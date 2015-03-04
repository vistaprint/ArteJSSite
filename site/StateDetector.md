---
layout: main
title: StateDetector
area: plugins
---

## State Detector

Extends Arte.Text area to add undo/redo capabilities

### Usage
The state detector exposes the following public api to the Arte Text Area

####Get State
Returns an object representing the current state for the whole selection (all nodes must share attribute to show as true i.e if there are two nodes and one is not bold the bold state will show as false)
{% highlight javascript %}
    $(".editor").Arte.getState(); 
{% endhighlight %}

####Get All States
Returns an array of state objects representing the current state for each node in the selection
{% highlight javascript %}
    $(".editor").Arte.getAllStates(); 
{% endhighlight %}

### State Object
The state object has all the attributes of the editor that can be modified
{% highlight javascript %}
    var state = {
        bold: true,
        italic: false
        fontSize: 10,
        ...
    }    
{% endhighlight %}
