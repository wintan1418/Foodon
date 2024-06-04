import*as t from"has-tostringtag/shams";var a="default"in t?t.default:t;var r={};var e=Date.prototype.getDay;var o=function tryDateGetDayCall(t){try{e.call(t);return true}catch(t){return false}};var l=Object.prototype.toString;var n="[object Date]";var c=a();r=function isDateObject(t){return"object"===typeof t&&null!==t&&(c?o(t):l.call(t)===n)};var u=r;export default u;

