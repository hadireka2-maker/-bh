import{s}from"./index-BSFKT4iA.js";async function t(r){const{error:o}=await s.from("revisions").upsert(r,{onConflict:"id"});if(o)throw o}export{t as upsertRevision};
