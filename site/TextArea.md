---
layout: main
title: TextArea
area: core
---

## Text Area

The ArteText area is where you do all your rich text modifications. Plugins and other core functionality will extend the prototype of the Arte.TextArea object on which you will make all your changes.

### Usage
The following are included on the core TextArea object



####Value
{% highlight javascript %}
/**
 * Get or Set innerHtml of the contentEditable element
 * @params {string} value string to set innerHTML of element to
 * @returns {string} returns'innerHTML' of the contentEditable element if in rich text mode or 'value' of the element if in plaintext mode if getting value, otherwise returns nothing
 */
{% endhighlight %}

{% highlight javascript %}
    var arte = $(".editor").Arte();
    arte.value();
{% endhighlight %}
or 
{% highlight javascript %}
    var arte = $(".editor").Arte();
    arte.value("Enter your text here");
{% endhighlight %}


####Outer Value
{% highlight javascript %}
/**
 * Gets or sets outerHtml of the contentEditable element
 * @params {string} value html string to set outerHTML of element to
 * @returns {string} returns 'outerHTML' of the contentEditable element with contentEditable tag removed
 */
{% endhighlight %}
 
{% highlight javascript %}
    var arte = $(".editor").Arte();
    arte.outerValue();
{% endhighlight %}
or 
{% highlight javascript %}
    var arte = $(".editor").Arte();
    arte.outerValue("<div> Text editor </div>");
{% endhighlight %}

####Focus
{% highlight javascript %}
/**
 * Calls a focus event on the contentEditable element, moves the cursor to the end of that element, and fires an onselectionchange event
 */
 

    var arte = $(".editor").Arte();
    arte.focus();
{% endhighlight %}

####Trigger Event
{% highlight javascript %}
/**
 * Calls a focus event on the contentEditable element, moves the cursor to the end of that element, and fires an onselectionchange event
 */
 

    var arte = $(".editor").Arte();
    arte.triggerEvent("eventName", eventData);
{% endhighlight %}

####Destroy
{% highlight javascript %}
    /**
    * Removes Arte from this element (Converts the rich text editor to non-editable state and remove rich text state information)
    * @params {Object} options - pass in 'removeContent' in options object to also clear the element of all text and formatting
    */
    var arte = $(".editor").Arte();
    arte.destroy();
{% endhighlight %}