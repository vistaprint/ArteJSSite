---
layout: main
area: events
---

##Events
ArteJS raises a rich collection of events to interact with the editor.
{% highlight javascript %}
// Listening to events
$(selector).on('eventname', function(e, data) {...});
 
// Another way to listen to events
editorInstance.on('eventname', function(e, data) {...});
{% endhighlight %}
###Events raised by the editor:
* onfocus -- editor gained focus
* onblur -- editor lost focus
* onvaluechange -- rich text value changed
* onmousedown -- mouse down over the editor
* onmouseup -- mouse up over the editor
* onclick -- mouse clicked over the editor
* onkeydown -- key down over the editor
* onkeypress -- key press over the editor
* onkeyup -- key up over the editor
* onpaste -- content pasted into the editor
* onselectionchange -- editor text selection changed
* onbeforecommand -- fired before a command is executed
* oncommand -- fired after a command has been executed
* oncreate -- editor has been created
* ondestroy -- editor has been destroyed

###Events raised by plugins:
####Insert/replace content plugin:

* onbeforeinsert -- fired before insertion occurs
* oninsert -- fired after insertion occurs
####Paste handler:

* onbeforehandlepaste -- fired before paste occurs
* onafterhandlepaste -- fired after paste occurs
####Undo/redo:

* onbeforeundo -- fired before undo occurs
* onafterundo -- fired after undo occurs
* onbeforeredo -- fired before redo occurs
* onafterredo -- fired after redo occurs