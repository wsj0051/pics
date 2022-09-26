// ==UserScript==
// @name         学科网下载
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  增加内容链接地址
// @author       wsj0051
// @match        https://www.zxxk.com/soft/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=zxxk.com
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    let start = function(){
    var ss = document.querySelector(".preview-main");
    if (ss) {
            window.scrollTo(0,ss.offsetHeight);
            var child = ss.children;
            let urlArray = [];
            for(var i=0;i<child.length;i++){
                let url = child[i].dataset.original;
                let btn = document.createElement('a');
                btn.style.cssText = `margin-right:5px;cursor:pointer;`;
                btn.innerHTML = "<a href="+url+" target='_blank'>第"+(i+1)+"页</a>";
                console.log(url);
                urlArray.push(btn);
            }
            urlArray.forEach(element => {
                ss.append(element);
            });
    }else{
        console.log('非正常页面，1秒后将重新查找！');
        sleep(500).then(() => {
            start();
        })
        return;

    }
    }
    let sleep = function (time) {
        return new Promise((resolve) => setTimeout(resolve, time));
    };
    sleep(500).then(() => {
        start();
    })
})();
