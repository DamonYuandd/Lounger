= What is this =

 This is a manual jquery.msgbox for version 7.0

= Box structure =

                background
   +--------------mainWrap---------------+
   |+---------------headWrap------------+|
   ||+-----titleWrap-----+--closeWrap--+||
   ||| title              | closeIcon  |||
   ||+--------------------+------------+||
   |+-----------------------------------+|
   |+----------contentWrapWrap----------+|
   ||+-----------contentWrap-----------+||
   |||  content                        |||
   ||+---------------------------------+||
   |+-----------------------------------+|
   +-------------------------------------+

= Parameters instruction =

  * width             : (number)   the width of the box
  * height            : (number)   the height of the box
  * title             : (string)   the title of the box
  * content           : (string)   the content to show (support HTML)
  * bgOpacity         : (number)   the opacity of the background
  
= INTERNAL PLUGINS =
  * dragndrop: allow drag and drop for msgbox, but a reference to jquery.dragndrop I offered is needed.
  * resetposition: re-locate the background and msgbox when the window is scrolling or resizing (this plugin is not recommended to be disabled or removed)
  * onclose: add a callback when closing
    options added: onClose 每 the callback 
  * autoclose: add a auto-close function
    options added: autoClose 每 seconds that msgbox will be closed.
    public functions:
      startAutoClose(int) 每 start auto-close counting down
      endAutoClose() 每 end auto-close counting down
  * contenttype: let msgbox support multiple types of content
    options added:
      type ㄜ type of content: iframe, ajax(=url), input, alert, confirm
      onAjaxed 每 callback when ajax complete
    public functions:
      getValue() 每 get return value of msgbox(confirm or input)
  * flashtitle: flash the title when clicking the background( simulate Windows )
  * animate: allow animation when opening or closing msgbox
    options added: anim 每 type of animations(default:0, supported: 0,1,2. there will be no animations with other values)
  * showclose: allow show or hide the close button
    options added: showClose(true|false) 每 show or hide the close button
    public functions: setShowClose(true|false) 每 show or hide the close button
  * bgdblclick2close: dblclick to close the msgbox. It will not work when opts.showClose = false or setShowClose(false) if showclose plugin refered.
  * closeicon: allow to add a user-defined close button.
    options added: closeIcon(string) 每 will be displayed in closeWrap, if starts with ＆text:＊,
      string after the prefix will be displayed; else if starts with ＆image:＊, an image with src = string after the prefix will be displayed.
      if starts with none of the two prefixes, ＆text:＊ will be added automatically.

= BASIC USAGE( WITHOUT INTERNAL PLUGINS ) =

  * The simplest way
    new $.msgbox('Hello world').show();
 
  * options
    new $.msgbox({
        width:500,
        height:500,
        title: 'Hello',
        content: 'Hello, world!',
        bgOpacity: .8
    }).show();

= USAGE WITH INTERNAL PLUGINS =

  * plugin dragndrop
    new $.msgbox({
        allowDrag: true // enable drag and drop(default), disable if false
    }).show();
 
  * plugin onclose
    new $.msgbox({
        onClose: function(){
            alert(this.titleWrap.html()); // this is refered to the object itself
        }
    }).show();
 
  * plugin autoclose
    new $.msgbox({
        autoClose: 10  // start counting down when the box is showing
    }).show();
 
    new $.msgbox({
        autoClose: 0 // do not counting down
    }).show().startAutoClose(10);  // start counting down, support chain operations
 
  * plugin contenttype
    new $.msgbox({
        type: 'alert',
        content: 'Hello'
    }).show();
 
    new $.msgbox({
        onClose: function(){ alert(this.getValue()) }, // with onclose plugin
        type: 'confirm',
        content: 'Hello'
    }).show();
 
    new $.msgbox({
        onClose: function(){ alert(this.getValue()) },
        type: 'input',
        content: 'Enter your words:'
    }).show();
 
    new $.msgbox({
        onAjaxed: function(){ alert('Loading complete') },
        type: 'ajax',   // or url 
        content: 'http://pwwang.com'
    }).show();
 
    new $.msgbox({
        type: 'iframe',
        content: 'http://pwwang.com'
    }).show();
     
  * plugin animate
    new $.msgbox({
        anim: 0  // 1, 2, no animation with other values
    }).show();
 
  * plugin showclose
    new $.msgbox({
        showClose: false    // disable in options
    }).show().showClose(true);  // but enable in public function 
 
  * plugin closeicon
    new $.msgbox({
        closeIcon: 'Close'  // or 'text:Close', or 'image:close.png' to display an image
    }).show();

= PLUGIN DEVELOPMENT DOCUMENTATION =
  You can realize functions in your plugin, add options or public functions
  * Variables for operating
    this.opts 每 options of msgbox / Object
    this.background 每 the background / jQuery Object
    this.mainWrap 每 the outest wrapper of msgbox / jQuery Object
    this.headWrap 每 the header wrapper of msgbox / jQuery Object
    this.titleWrap 每 wrapper contains title / jQuery Object
    this.closeWrap 每 wrapper contains the close text/image(a) / jQuery Object
    this.contentWrapWrap 每 wrapper contains the wrapper of content / jQuery Object
         This is to avoid display to be broken by setting a padding value to style of content wrapper
    this.contentWrap 每 wrapper contain the contents / jQuery Object
  * Entrance of plugin
    options() -  handle the options and operations before dom assembling.
    domready() 每 operations after dom assembling and before msgbox showing.
  * Helper functions for plugins
    this.extend(name, value) 每 to extend inline functions or options.
        if name is either ＆show＊ or ＆close＊, or some other public functions defined by plugins, it will be automatically recognized and overrided.
            Usage: this.extend(＆show＊, function(self){ ＃ }); If the original function is still needed to be called,
            please use: self.apply(this,arguments)  to make ＆this＊ in the original function remain available.
        if name is an option, value if the default when this options is omitted.
    this.is_active(pluginName) 每 to judge if a plugin is loaded or activated.
        if you do not need one of the plugins, you can remove the code of the plugin( not recommended ), or add a key/value
        active:false to this plugin. Or even you can put the plugin name to the option pluginsOff(Array), e.g.:
        new $.msgbox({ pluginsOff:['dragndrop'] }).show(); then you can disable drag and drag when produce a msgbox this time.
        The options pluginsOn and pluginsOff is superior to the active value in plugins.
        The active value will be true if omitted.
        Any of the situation makes the plugin not loaded, or the plugin does not exist, it will return false, else will return true.
        This function is useful to tell if other plugins affect your actions in your plugin.

= SO-CALLED LOAD-ON-DEMAND =
  If you think a plugin is totally unnecessary, you can remove the code, and it will not affect other
  functions. This is not recommended(especially for the plugin resetposition), however, and not
  necessary to do it like that. A key/value active:false being inserted to the plugin will make it de-activated.
  And if some time, you＊d like to use this plugin for just one time, you can set the plugin name into
  the options pluginsOn array to force the plugin be availale. In the similar way, if active value of a
  plugin is not set to false, and you want to disable it once, put the plugin name in pluginsOff will
  do it.
         

= AN PLUGIN EXAMPLE =
  Some may need a function to fix the bug in IE6 that ＆select＊ cannot be masked by the background
  of msgbox(the mask layer). Actually you can make it as a plugin. I haven＊t make this plugin as an
  internal one since I do not want to be a one that helps to prevent development of new things. I mean,
  just let IE6 go＃

  (function($){
 
    $.msgbox.bgiframe = {
 
        //active: false,    // if you do not want this plugin        
 
        options: function(){ // handling options
            this.extend('bgiframe', true); // default: true
            // It is totally not necessary to use this option in real situation
            // It is just for example I used it here
        },
 
        domreaddy: function(){
            this.background.bgiframe();  // please refer jquery.bgiframe plugin first...
        }
 
    }
 
  })(jQuery);
        