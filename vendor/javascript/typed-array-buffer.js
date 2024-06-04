import*as r from"es-errors/type";import*as a from"call-bind/callBound";import*as t from"is-typed-array";var e=r;try{"default"in r&&(e=r.default)}catch(r){}var f=a;try{"default"in a&&(f=a.default)}catch(r){}var o=t;try{"default"in t&&(o=t.default)}catch(r){}var u={};var d=e;var y=f;var l=y("TypedArray.prototype.buffer",true);var p=o;
/** @type {import('.')} */u=l||function typedArrayBuffer(r){if(!p(r))throw new d("Not a Typed Array");return r.buffer};var i=u;export{i as default};

