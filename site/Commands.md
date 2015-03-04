---
layout: main
title: Commands
area: core
---

## Commands

Extends Arte.Text area to add rich text commands

### Basic Usage

####Supported using HTML Tag, Style, or Class

#####Bold
Make the selected text bold

{% highlight javascript %}
    var arte = $(".editor").Arte();
    arte.bold(); 
{% endhighlight %}


#####Italic
Make the selected text italic

{% highlight javascript %}
    arte.italic(); 
{% endhighlight %}

#####Italic
Make the selected text underlined

{% highlight javascript %}
    arte.underline(); 
{% endhighlight %}

####Supported using Style, or Class

#####Align
Make the selected text bold

{% highlight javascript %}
    arte.align("left"); 
{% endhighlight %}

#####Background Color
Change the size of the selected text

{% highlight javascript %}
    arte.backgroundColor("#123456"); 
{% endhighlight %}

#####Font Size
Make the selected text italic

{% highlight javascript %}
    arte.fontSize("12px"); 
{% endhighlight %}

#####Font Family
Make the selected text italic

{% highlight javascript %}
    arte.fontFamily("arial"); 
{% endhighlight %}

#####Color
Make the selected text italic

{% highlight javascript %}
    arte.color("#123456"); 
{% endhighlight %}

###Overriding the way commands are applied

Override the global configuration to apply bold using B tags

{% highlight javascript %}
    arte.bold({ tagName: "B" }); 
{% endhighlight %}

Override the global configuration to apply bold using Strong tags

{% highlight javascript %}
    arte.bold({ tagName: "STRONG" }); 
{% endhighlight %}

Override the global configuration to apply bold using a className

{% highlight javascript %}
    arte.bold({ className: "arte-font-weight-bold" }); 
{% endhighlight %}

Apply the command using the styleName

{% highlight javascript %}
    arte.bold({ styleName: "font-weight", styleValue: "bold" }); 
{% endhighlight %}
