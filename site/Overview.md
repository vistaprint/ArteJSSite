---
layout: main
area: overview
---

##Creating a rich text editor
{% highlight javascript %}
// Creating a rich text editor with default initial values ($.Arte.configuration.initialValues)
$(selector).Arte();

// Creating a rich text editor with options
var options = {
    styles: {
        "font-weight": "bold",
        "font-size": "16px"
    },
    classes: ["arte-class1", "arte-class2"],
    value: "This is &lt;span style='color: green'&gt;new&lt;/span&gt; value"
};

// Construct the text area
// The following takes a set of matched elements and convert them to rich text editors
$(selector).Arte(options);
{% endhighlight %}

##Executing Arte methods

{% highlight javascript %}
// Once a rich text editor is created, any rich text method can now be executed as the following
$(selector).Arte("methodName", parameter1, parameter2, ...);

// Alternatively, a method can be applied to an Arte instance directly like this
var editorInstances = $(selector).Arte();
$(selector).Arte().each(function(){
    this.methodName(parameter1, parameter2);
});

// or like this
editorInstances.get(0).methodName(parameter1, parameter2);

// One way to invoke methods
$(selector).Arte("bold"); // make the selection bold
$(selector).Arte("fontSize", "12px"); // set the fontsize of the selection to 12px

// Another way
$(selector).Arte().each(function(){
    this.bold();
    this.fontSize("12px");
});
{% endhighlight %}

##Changing the way a rich text command is applied

{% highlight javascript %}
// Many rich text commands can be applied using a tagName, style and class.
// For example, the bold command be applied as either:
//      a style (font-weight), a class (.font-weight), or as HTML tags (b or strong).
// ArteJS allows us to choose how a rich text command is applied using the following mechanisms:
// 1) Supplying the command attribute type in the command options:
//      ({commandAttrType = "styleName" | "className" | "tagName"})
// 2) Inferring the command attribute type from the values in the options: ({className = "..."})
// 3) Using the default command attribute type specified in the configuration file:
//      (Arte.configuration.commandAttrType)

// ArteJS configuration allows setting the commandAttrType globally or per command.
// For the commands that can only be applied one way (e.g. H1, BlockQuotes, etc.),
// the commandAttrType is ignored.

// Bold is applied based on the global configuration
$(selector).Arte("bold");

// Override the global configuration to apply bold using B or Strong tags
$(selector).Arte("bold", { tagName: "B" });
$(selector).Arte("bold", { tagName: "STRONG" });

// Override the global configuration to apply bold using a className
$(selector).Arte("bold", { className: "arte-font-weight-bold" });

// Apply the command using the styleName
$(selector).Arte("bold", { styleName: "font-weight", styleValue: "bold" });
{% endhighlight %}

##Getting and setting the contents of the rich text editor

{% highlight javascript %}
// ArteJS allows getting the innerValue or the outerValue (like outerHTML) of the editor

// Get the value of a rich text editor
var value = $(selector).Arte("value");

// Set the value of a rich text editor
$(selector).Arte("value", "This can be any <b>valid</b> html fragment.");
$(selector).Arte("value", "&lt;div style='font-weight: bold'&gt;This can only be a " +
    "&lt;span style='font-weight: bold'&gt;single html element&lt;/span&gt; &lt;/div&gt;");

// Get an array of the outerHTML of all rich text editors associated with this selector
var outerValues = $(selector).Arte("outerValue");
{% endhighlight %}

##Interacting with rich text commands

{% highlight javascript %}
// Suppose we want to ensure that only valid values are used in rich text commands
// (e.g. a whitelist for font-size and font-family)
// or we need to translate some command values (e.g. convert color from CMYk to RGB).
// This can be achieved by listening to the `onbeforecommand` event
$("#editor").Arte("on", {
    "onbeforecommand": function (e, data) {
        switch (data.commandName) {
            case "fontSize":
                switch (data.commandValue) {
                    // Translate the commandValue to a valid fontSize
                    case "Big font":
                        data.commandValue = "50px";
                        break;
                    case "Small font":
                        data.commandValue = "5px";
                        break;
                }
                break;
            case "fontFamily":
                if(!isFontInWhiteList(data.commandValue))
                {
                    // If font name is not whitelisted, don't execute the command
                    data.execute = false;
                }
                break;
        }
    }
});
{% endhighlight %}

##Extending ArteJS

{% highlight javascript %}
// Basic template for a plugin
(function(pluginManager) {
    // plugin internals
    var property;
    function pluginMethod() { }

    // Public methods
    $.extend($.Arte.TextArea.prototype, {
        publicMethodA: function{},
        publicMethodB: pluginMethod
    });

    var myPlugin = function () {
        return {
            init: function (textArea) {
                // any setup or listen to textArea events
            }
        }
    }

    // Register this plugin with the plugin manager
    pluginManager.register("myPlugin", myPlugin);
})($.Arte.pluginManager)
{% endhighlight %}

A few plugin <a href="https://github.com/vistaprint/ArteJS/tree/master/src/editor/plugins">examples</a>.

#Toolbar

##Configure toolbar dropdown
{% highlight javascript %}
// The toolbar allows setting the display value and actual value that is applied to text
// Note that the values need to be set according to the commandAttrType configuration

// Here are a few examples of setting the styles:

// Simply apply the font-size
$.Arte.Toolbar.configuration.buttons.fontSize.options = ["", 8, 10, 12, 15, 20];

// Example of the display value being different from the actual value
$.Arte.Toolbar.configuration.buttons.fontSize.options = [
    { display: "", value: "" },
    { display: "Smaller", value: 8 },
    { display: "Small", value: 10 },
    { display: "Medium", value: 12 },
    { display: "Large", value: 15 },
    { display: "Larger", value: 20 }
];

// Example where the actual value is the name of the class to be applied
$.Arte.Toolbar.configuration.buttons.fontSize.options = [
    { display: "", value: "" },
    { display: "Smaller", value: "arte-font-weight-8" },
    { display: "Small", value: "arte-font-weight-10" },
    { display: "Medium", value: "arte-font-weight-12" },
    { display: "Large", value: "arte-font-weight-15" },
    { display: "Larger", value: "arte-font-weight-20" }
];
{% endhighlight %}