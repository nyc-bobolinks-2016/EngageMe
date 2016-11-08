/*! timer.jquery 0.6.3 2016-08-09*/!function(a){function b(d){if(c[d])return c[d].exports;var e=c[d]={exports:{},id:d,loaded:!1};return a[d].call(e.exports,e,e.exports,b),e.loaded=!0,e.exports}var c={};return b.m=a,b.c=c,b.p="",b(0)}([function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}var e=c(1),f=d(e),g=c(2),h=d(g);!function(){$.fn.timer=function(a){return a=a||"start",this.each(function(){$.data(this,h["default"].PLUGIN_NAME)instanceof f["default"]||$.data(this,h["default"].PLUGIN_NAME,new f["default"](this,a));var b=$.data(this,h["default"].PLUGIN_NAME);"string"==typeof a?"function"==typeof b[a]&&b[a]():b.start()})}}()},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b){if(!(a instanceof b))throw new TypeError("Cannot call a class as a function")}Object.defineProperty(b,"__esModule",{value:!0});var f=function(){function a(a,b){for(var c=0;c<b.length;c++){var d=b[c];d.enumerable=d.enumerable||!1,d.configurable=!0,"value"in d&&(d.writable=!0),Object.defineProperty(a,d.key,d)}}return function(b,c,d){return c&&a(b.prototype,c),d&&a(b,d),b}}(),g=c(2),h=d(g),i=c(3),j=d(i),k=function(){function a(b,c){if(e(this,a),this.element=b,this.originalConfig=$.extend({},c),this.totalSeconds=0,this.intervalId=null,this.html="html","INPUT"!==b.tagName&&"TEXTAREA"!==b.tagName||(this.html="val"),this.config=j["default"].getDefaultConfig(),c.duration&&(c.duration=j["default"].durationTimeToSeconds(c.duration)),"string"!=typeof c&&(this.config=$.extend(this.config,c)),this.config.seconds&&(this.totalSeconds=this.config.seconds),this.config.editable&&j["default"].makeEditable(this),this.startTime=j["default"].unixSeconds()-this.totalSeconds,this.config.duration&&this.config.repeat&&this.config.updateFrequency<1e3&&(this.config.updateFrequency=1e3),this.config.countdown){if(!this.config.duration)throw new Error("Countdown option set without duration!");if(this.config.editable)throw new Error("Cannot set editable on a countdown timer!");this.config.startTime=j["default"].unixSeconds()-this.config.duration,this.totalSeconds=this.config.duration}}return f(a,[{key:"start",value:function(){this.state!==h["default"].TIMER_RUNNING&&(j["default"].setState(this,h["default"].TIMER_RUNNING),this.render(),this.intervalId=setInterval(j["default"].intervalHandler.bind(null,this),this.config.updateFrequency))}},{key:"pause",value:function(){this.state===h["default"].TIMER_RUNNING&&(j["default"].setState(this,h["default"].TIMER_PAUSED),clearInterval(this.intervalId))}},{key:"resume",value:function(){this.state===h["default"].TIMER_PAUSED&&(j["default"].setState(this,h["default"].TIMER_RUNNING),this.config.countdown?this.startTime=j["default"].unixSeconds()-this.config.duration+this.totalSeconds:this.startTime=j["default"].unixSeconds()-this.totalSeconds,this.intervalId=setInterval(j["default"].intervalHandler.bind(null,this),this.config.updateFrequency))}},{key:"remove",value:function(){clearInterval(this.intervalId),$(this.element).data(h["default"].PLUGIN_NAME,null)}},{key:"reset",value:function(){var a=this.element,b=this.originalConfig;this.remove(),$(a).timer(b)}},{key:"render",value:function(){this.config.format?$(this.element)[this.html](j["default"].secondsToFormattedTime(this.totalSeconds,this.config.format)):$(this.element)[this.html](j["default"].secondsToPrettyTime(this.totalSeconds)),$(this.element).data("seconds",this.totalSeconds)}}]),a}();b["default"]=k},function(a,b){"use strict";Object.defineProperty(b,"__esModule",{value:!0});var c={PLUGIN_NAME:"timer",TIMER_RUNNING:"running",TIMER_PAUSED:"paused",DAYINSECONDS:86400,THIRTYSIXHUNDRED:3600,SIXTY:60,TEN:10};b["default"]=c},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}Object.defineProperty(b,"__esModule",{value:!0});var e=c(2),f=d(e),g=function(){var a=arguments.length<=0||void 0===arguments[0]?0:arguments[0],b=0,c=0,d=Math.floor(a/f["default"].SIXTY),e=d,g=void 0;return a>=f["default"].DAYINSECONDS&&(b=Math.floor(a/f["default"].DAYINSECONDS)),a>=f["default"].THIRTYSIXHUNDRED&&(c=Math.floor(a%f["default"].DAYINSECONDS/f["default"].THIRTYSIXHUNDRED)),a>=f["default"].SIXTY&&(e=Math.floor(a%f["default"].THIRTYSIXHUNDRED/f["default"].SIXTY)),g=a%f["default"].SIXTY,{days:b,hours:c,minutes:e,totalMinutes:d,seconds:g,totalSeconds:a}},h=function(a){return a=parseInt(a,10),a<10?"0"+a:a},i=function(){return{seconds:0,editable:!1,duration:null,callback:function(){console.log("Time up!")},repeat:!1,countdown:!1,format:null,updateFrequency:500}},j=function(){return Math.round(Date.now()/1e3)},k=function(a){var b=g(a);if(b.days)return b.days+":"+h(b.hours)+":"+h(b.minutes)+":"+h(b.seconds);if(b.hours)return b.hours+":"+h(b.minutes)+":"+h(b.seconds);var c="";return c=b.minutes?b.minutes+":"+h(b.seconds)+" min":b.seconds+" sec"},l=function(a,b){var c=g(a),d=[{identifier:"%d",value:c.days},{identifier:"%h",value:c.hours},{identifier:"%m",value:c.minutes},{identifier:"%s",value:c.seconds},{identifier:"%g",value:c.totalMinutes},{identifier:"%t",value:c.totalSeconds},{identifier:"%D",value:h(c.days)},{identifier:"%H",value:h(c.hours)},{identifier:"%M",value:h(c.minutes)},{identifier:"%S",value:h(c.seconds)},{identifier:"%G",value:h(c.totalMinutes)},{identifier:"%T",value:h(c.totalSeconds)}];return d.forEach(function(a){b=b.replace(a.identifier,a.value)}),b},m=function(a){if(!a)throw new Error("durationTimeToSeconds expects a string argument!");if(!isNaN(Number(a)))return a;a=a.toLowerCase();var b=a.match(/\d{1,2}d/),c=a.match(/\d{1,2}h/),d=a.match(/\d{1,2}m/),e=a.match(/\d{1,2}s/);if(!(b||c||d||e))throw new Error("Invalid string passed in durationTimeToSeconds!");var g=0;return b&&(g+=Number(b[0].replace("d","")*f["default"].DAYINSECONDS)),c&&(g+=Number(c[0].replace("h","")*f["default"].THIRTYSIXHUNDRED)),d&&(g+=Number(d[0].replace("m",""))*f["default"].SIXTY),e&&(g+=Number(e[0].replace("s",""))),g},n=function(a){var b=void 0,c=void 0;return a.indexOf("sec")>0?c=Number(a.replace(/\ssec/g,"")):a.indexOf("min")>0?(a=a.replace(/\smin/g,""),b=a.split(":"),c=Number(b[0]*f["default"].SIXTY)+Number(b[1])):a.match(/\d{1,2}:\d{2}:\d{2}:\d{2}/)?(b=a.split(":"),c=Number(b[0]*f["default"].DAYINSECONDS)+Number(b[1]*f["default"].THIRTYSIXHUNDRED)+Number(b[2]*f["default"].SIXTY)+Number(b[3])):a.match(/\d{1,2}:\d{2}:\d{2}/)&&(b=a.split(":"),c=Number(b[0]*f["default"].THIRTYSIXHUNDRED)+Number(b[1]*f["default"].SIXTY)+Number(b[2])),c},o=function(a,b){a.state=b,$(a.element).data("state",b)},p=function(a){$(a.element).on("focus",function(){a.pause()}),$(a.element).on("blur",function(){a.totalSeconds=n($(a.element)[a.html]()),a.resume()})},q=function(a){return a.totalSeconds=j()-a.startTime,a.config.countdown?(a.totalSeconds=a.config.duration-a.totalSeconds,0===a.totalSeconds&&(clearInterval(a.intervalId),o(a,f["default"].TIMER_STOPPED),a.config.callback(),$(a.element).data("seconds")),void a.render()):(a.render(),void(a.config.duration&&a.totalSeconds>0&&a.totalSeconds%a.config.duration===0&&(a.config.callback&&a.config.callback(),a.config.repeat||(clearInterval(a.intervalId),o(a,f["default"].TIMER_STOPPED),a.config.duration=null))))};b["default"]={getDefaultConfig:i,unixSeconds:j,secondsToPrettyTime:k,secondsToFormattedTime:l,durationTimeToSeconds:m,prettyTimeToSeconds:n,setState:o,makeEditable:p,intervalHandler:q}}]);

// var base = 60,
//     clocktimer,
//     dateObj,
//     dh,
//     dm,
//     ds,
//     ms,
//     readout='',
//     h=1,
//     m=1,
//     tm=1,
//     s=0,
//     ts=0,
//     ms=0,
//     show=true,
//     init=0,
//     mPLUS=new Array('m0', 'm1', 'm2', 'm3', 'm4', 'm5', 'm6', 'm7', 'm8', 'm9'),
//     ii=0;
//
// function clearALL() {
//   clearTimeout(clocktimer);
//   h=1;
//   m=1;
//   tm=1;
//   s=0;
//   ts=0;
//   ms=0;
//   init=0;
//   show=true;
//   readout='00:00:00.00';
//   document.clockform.clock.value = readout;
//   var CF = document.clockform;
//   for (var ij=0; ij<=9; ij++) {
//     CF[mPLUS[ij]].value = '';
//   }
//   ii = 0;
// }
//
// function addMEM() {
//   if (init>0) {
//     var CF = document.clockform;
//     CF[mPLUS[ii]].value = readout;
//     if (ii==9) {
//       ii = 0;
//     } else {
//       ii++;
//     }
//   }
// }
//
//
// function startTIME() {
//   var cdateObj = new Date();
//   var t = (cdateObj.getTime() - dateObj.getTime())-(s*1000);
//
//   if (t>999) { s++; }
//
//   if (s>=(m*base)) {
//     ts=0;
//     m++;
//   } else {
//     ts=parseInt((ms/100)+s);
//     if(ts>=base) { ts=ts-((m-1)*base); }}
//
//     if (m>(h*base)) {
//       tm=1;
//       h++;
//     } else {
//       tm=parseInt((ms/100)+m);
//       if(tm>=base) { tm=tm-((h-1)*base); }
//     }
//
//     ms = Math.round(t/10);
//     if (ms>99) {ms=0;}
//     if (ms==0) {ms='00';}
//     if (ms>0&&ms<=9) { ms = '0' + ms; }
//
//     if (ts>0) { ds = ts; if (ts<10) { ds = '0'+ts; }} else { ds = '00'; }
//     dm=tm-1;
//     if (dm>0) { if (dm<10) { dm = '0'+dm; }} else { dm = '00'; }
//     dh=h-1;
//     if (dh>0) { if (dh<10) { dh = '0'+dh; }} else { dh = '00'; }
//
//     readout = dh + ':' + dm + ':' + ds + '.' + ms;
//     if (show) { document.clockform.clock.value = readout; }
//
//     clocktimer = setTimeout("startTIME()",1);
// }
//
// function findTIME() {
//   if (init==0) {
//     dateObj = new Date();
//     startTIME();
//     init=1;
//   } else {
//     if(show) {
//       show = false;
//     } else {
//       show = true;
//     }
//   }
// }
