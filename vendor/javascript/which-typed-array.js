import*as r from"for-each";import*as a from"available-typed-arrays";import*as t from"call-bind";import*as e from"call-bind/callBound";import*as o from"gopd";import*as n from"has-tostringtag/shams";var f=r;try{"default"in r&&(f=r.default)}catch(r){}var l=a;try{"default"in a&&(l=a.default)}catch(r){}var i=t;try{"default"in t&&(i=t.default)}catch(r){}var c=e;try{"default"in e&&(c=e.default)}catch(r){}var u=o;try{"default"in o&&(u=o.default)}catch(r){}var v=n;try{"default"in n&&(v=n.default)}catch(r){}var d=typeof globalThis!=="undefined"?globalThis:typeof self!=="undefined"?self:global;var y={};var s=f;var p=l;var g=i;var h=c;var m=u;
/** @type {(O: object) => string} */var b=h("Object.prototype.toString");var S=v();var T=typeof globalThis==="undefined"?d:globalThis;var O=p();var A=h("String.prototype.slice");var j=Object.getPrototypeOf;
/** @type {<T = unknown>(array: readonly T[], value: unknown) => number} */var _=h("Array.prototype.indexOf",true)||function indexOf(r,a){for(var t=0;t<r.length;t+=1)if(r[t]===a)return t;return-1};
/** @typedef {(receiver: import('.').TypedArray) => string | typeof Uint8Array.prototype.slice.call | typeof Uint8Array.prototype.set.call} Getter */
/** @type {{ [k in `\$${import('.').TypedArrayName}`]?: Getter } & { __proto__: null }} */var w={__proto__:null};s(O,S&&m&&j?function(r){var a=new T[r];if(Symbol.toStringTag in a){var t=j(a);var e=m(t,Symbol.toStringTag);if(!e){var o=j(t);e=m(o,Symbol.toStringTag)}w["$"+r]=g(e.get)}}:function(r){var a=new T[r];var t=a.slice||a.set;t&&(w["$"+r]=g(t))}
/** @type {(value: object) => false | import('.').TypedArrayName} */);var x=function tryAllTypedArrays(r){
/** @type {ReturnType<typeof tryAllTypedArrays>} */var a=false;s(
/** @type {Record<`\$${TypedArrayName}`, Getter>} */ /** @type {any} */
w,(/** @type {(getter: Getter, name: `\$${import('.').TypedArrayName}`) => void} */
function(t,e){if(!a)try{"$"+t(r)===e&&(a=A(e,1))}catch(r){}}));return a};
/** @type {(value: object) => false | import('.').TypedArrayName} */var $=function tryAllSlices(r){
/** @type {ReturnType<typeof tryAllSlices>} */var a=false;s(
/** @type {Record<`\$${TypedArrayName}`, Getter>} */ /** @type {any} */
w,(/** @type {(getter: typeof cache, name: `\$${import('.').TypedArrayName}`) => void} */function(t,e){if(!a)try{t(r);a=A(e,1)}catch(r){}}));return a};
/** @type {import('.')} */y=function whichTypedArray(r){if(!r||typeof r!=="object")return false;if(!S){
/** @type {string} */
var a=A(b(r),8,-1);return _(O,a)>-1?a:a==="Object"&&$(r)}return m?x(r):null};var B=y;export{B as default};

