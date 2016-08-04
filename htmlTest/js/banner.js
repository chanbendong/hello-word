if(window.attachEvent)
{
    window.attachEvent("load", function () {
        babyzone.scroll(4,"banner_list","list","banner_info");
    })
}
else
{
    window.addEventListener("load", function () {
        babyzone.scroll(4,"banner_list","list","banner_info");
    })
}

var babyzone = function () {
    function id(name) {
        return document.getElementById(name);
    }
    function each (arr, callback, thisp) {
        if(arr.forEach){
            arr.forEach(callback, thisp);
        }else{
            for(var i = 0, len = arr.length; i < len; i++){
                callback.call(thisp, arr[i], i, arr);
            }
        }
    }
    function fadeIn(elem) {
        setOpacity(elem, 0);
        for (var i = 0; i < 20; i++){
            (function () {
                var pos = i * 5;
                setTimeout(function () {
                    setOpacity(elem, pos)
                },i * 25);
            })(i);
        }
    }
    function fadeOut(elem) {
        for (var i = 0; i <= 20; i++){
            (function () {
                var pos = 100 - i * 5;
                setTimeout(function () {
                    setOpacity(elem, pos)
                },i * 25);
            })(i);
        }
    }
    //设置透明度
    function setOpacity(elem, level) {
        if (elem.filters){
            elem.style.filter = "alpha(opacity="+ level + ")";
        }else {
            elem.style.opacity = level/100;
        }
    }
    return{
        scroll : function (count,wrapId,ulId,infoId) {
            var self = this;
            var targetIdx = 0; //目标图片序号
            var curIndex = 0; //现在图片序号
            var frag = document.createDocumentFragment();
            this.num = [];
            this.info = id(infoId);
            for(var i = 0; i < count; i++){
                (this.num[i] = frag.appendChild(document.createElement("li"))).innerHTML = i+1;
            }
            id(ulId).appendChild(frag);

            //初始化信息
            this.img = id(wrapId).getElementsByTagName("a");
            this.info.innerHTML = self.img[0].firstChild.title;
            this.num[0].className = "on";
            //将除了一张外的所有图片设置为透明
            each(this.img, function (elem, idx, arr) {
                if (idx != 0) setOpacity(elem, 0);
            });

            //为所有的li添加点击事件
            each(this.num, function (elme, idx, arr) {
                elme.onclick = function () {
                    self.fade(idx,curIndex);
                    curIndex = idx;
                    targetIdx = idx;
                }
            });

            var itv = setInterval(function () {
                if (targetIdx<self.num.length-1){
                    targetIdx++;
                }else {
                    targetIdx = 0;
                }
                self.fade(targetIdx,curIndex);
                curIndex = targetIdx;
            },1500);
            id(ulId).onmouseover = function () {
                clearInterval(itv)
            };
            id(ulId).onmouseout = function () {
                itv = setInterval(function () {
                    if (targetIdx<self.num.length-1){
                        targetIdx++;
                    }else {
                        targetIdx = 0;
                    }
                    self.fade(targetIdx,curIndex);
                    curIndex = targetIdx;
                },1500);
            }
        },
        fade : function (idx, lastIdx) {
            if (idx == lastIdx) return;
            var self = this;
            fadeOut(self.img[lastIdx]);
            fadeIn(self.img[idx]);
            each(self.num, function (elem, elemIdx, arr) {
                if (elemIdx != idx){
                    self.num[elemIdx].className = '';
                }else {
                    id("list").style.background = "";
                    self.num[elemIdx].className = 'on';
                }

            });
            this.info.innerHTML = self.img[idx].firstChild.title;
        }
    }
}();

