import*as r from"es-define-property";var e=r;try{"default"in r&&(e=r.default)}catch(r){}var t={};var a=e;var n=function hasPropertyDescriptors(){return!!a};n.hasArrayLengthDefineBug=function hasArrayLengthDefineBug(){if(!a)return null;try{return a([],"length",{value:1}).length!==1}catch(r){return true}};t=n;var u=t;export{u as default};

