import*as t from"for-each";import*as a from"call-bind";import*as r from"available-typed-arrays";import*as e from"has-proto";import*as f from"gopd";import*as o from"is-typed-array";var i=t;try{"default"in t&&(i=t.default)}catch(t){}var n=a;try{"default"in a&&(n=a.default)}catch(t){}var l=r;try{"default"in r&&(l=r.default)}catch(t){}var y=e;try{"default"in e&&(y=e.default)}catch(t){}var u=f;try{"default"in f&&(u=f.default)}catch(t){}var v=o;try{"default"in o&&(v=o.default)}catch(t){}var c=typeof globalThis!=="undefined"?globalThis:typeof self!=="undefined"?self:global;var d={};var p=i;var s=n;var b=l();
/** @typedef {Int8Array | Uint8Array | Uint8ClampedArray | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array | BigInt64Array | BigUint64Array} TypedArray */
/** @typedef {(x: TypedArray) => number} ByteOffsetGetter */
/** @type {Object.<typeof typedArrays, ByteOffsetGetter>} */var m={};var h=y();var g=u;var O=Object.defineProperty;if(g){
/** @type {ByteOffsetGetter} */
var getByteOffset=function(t){return t.byteOffset};p(b,(function(t){if(typeof c[t]==="function"||typeof c[t]==="object"){var a=c[t].prototype;var r=g(a,"byteOffset");if(!r&&h){var e=a.__proto__;r=g(e,"byteOffset")}if(r&&r.get)m[t]=s(r.get);else if(O){var f=new c[t](2);r=g(f,"byteOffset");r&&r.configurable&&O(f,"length",{value:3});f.length===2&&(m[t]=getByteOffset)}}}))}
/** @type {ByteOffsetGetter} */var _=function tryAllTypedArrays(t){
/** @type {number} */var a;p(m,(/** @type {(getter: ByteOffsetGetter) => void} */function(r){if(typeof a!=="number")try{var e=r(t);typeof e==="number"&&(a=e)}catch(t){}}));return a};var A=v;
/** @type {import('.')} */d=function typedArrayByteOffset(t){return!!A(t)&&_(t)};var T=d;export{T as default};

