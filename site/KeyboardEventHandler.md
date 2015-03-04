---
layout: main
title: keyboardEventHandler
area: plugins
---

## Keyboard Event Handler

Extends Arte.Text area to listen to and handle keyboard events

### Supported Events

The keyboard event handler adds support for the following:
<table>
    <tr>
        <td>*Key Event*</td>
        <td>*Action*</td>
    </tr>
    <tr>
        <td>CTRL+B</td>
        <td>Bold</td>
    </tr>
    <tr>
        <td>CTRL+I</td>
        <td>Italic</td>
    </tr>
    <tr>
        <td>CTRL+U</td>
        <td>Underline</td>
    </tr>
    <tr>
        <td>CTRL+A, CTRL+V, All Arrow Keys</td>
        <td>Fires onselectionchange event</td>
    </tr>
</table>