var map, layerWorld, marker, markers;
//var url = "http://192.168.1.114:8090/iserver/services/map-sde/rest/maps/25D@25D";
var url = "http://139.196.242.134:8090/iserver/services/map-sdm/rest/maps/25D@25D";
var infowin = null;
$(
    function () {
        init(); 
    },

     init = function () {
         //map上添加控件
         map = new SuperMap.Map("map", {
             controls: [
                         new SuperMap.Control.PanZoomBar(),
                         new SuperMap.Control.ScaleLine(),
                         new SuperMap.Control.OverviewMap(),
                         new SuperMap.Control.LayerSwitcher(),
                         new SuperMap.Control.Navigation({ //添加导航控件到map
                             dragPanOptions: {
                                 enableKinetic: false //拖拽动画
                             }
                         })
             ]
         });

         //定义layerWorld图层，获取图层服务地址
         layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("25D@25D", url);
         //为图层初始化完毕添加layerInitialized事件
         layerWorld.events.on({ "layerInitialized": addLayer });
         //初始化标记图层类
         markers = new SuperMap.Layer.Markers("Markers");

         layerWorld.events.on({ "layerInitialized": addMarker });

     },
    //定义mouseClickHandler函数，触发click事件会调用此函数
     mouseClickHandler = function (event) {
         closeInfoWin();
         //初始化popup类
         popup = new SuperMap.Popup("chicken", marker.getLonLat(), new SuperMap.Size(220, 140), '<img src="supermap/images/xila.jpg">', true, null);

         infowin = popup;
         //添加弹窗到map图层
         map.addPopup(popup);
     },

   closeInfoWin = function () {
       if (infowin) {
           try {
               infowin.hide();
               infowin.destroy();
           }
           catch (e) { }
       }
   },

    //定义addLayer函数，触发 layerInitialized事件会调用此函数
    addLayer = function () {
        //map上添加分块动态REST图层和标记图层
        map.addLayers([layerWorld, markers]);
        map.setCenter(new SuperMap.LonLat(23, 38), 4);
    },

    //定义addMarker函数，触发layerInitialized事件会调用此函数
    addMarker = function () {
        size = new SuperMap.Size(21, 25);
        offset = new SuperMap.Pixel(-(size.w / 2), -size.h);
        icon = new SuperMap.Icon('supermap/images/markerbig_select.png', size, offset);
        //初始化标记覆盖物类
        marker = new SuperMap.Marker(new SuperMap.LonLat(23.6530190, 37.9439259), icon);
        //添加覆盖物到标记图层
        markers.addMarker(marker);

        //初始化标记覆盖物类
        marker = new SuperMap.Marker(new SuperMap.LonLat(23.6530190, 37.9439259), icon);
        //添加覆盖物到标记图层
        markers.addMarker(marker);


        //注册 click 事件,触发 mouseClickHandler()方法
        marker.events.on({
            "click": mouseClickHandler,
            "touchstart": mouseClickHandler //假如要在移动端的浏览器也实现点击弹框，则在注册touch类事件
        });
    }
);






