---
layout: main
title: UndoManager
area: plugins
---

## Undo Manager

Extends Arte.Text area to add undo/redo capabilities

### Usage
The undo manager exposes the following public api to the Arte Text Area

####Undo
Perform an undo action
{% highlight javascript %}
    $(".editor").Arte.undo(); 
{% endhighlight %}

####Redo
Perform an redo action
{% highlight javascript %}
    $(".editor").Arte.redo(); 
{% endhighlight %}

####Has Undo
Whether or not the manager can undo (is there an undo on the stack)
{% highlight javascript %}
    var hasUndo = $(".editor").Arte.hasUndo(); 
{% endhighlight %}

####Has Redo
Whether or not the manager can redo (is there a redo on the stack)

{% highlight javascript %}
    var hasRedo = $(".editor").Arte.hasRedo(); 
{% endhighlight %}