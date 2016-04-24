<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="views_HomePage" %>

<!DOCTYPE html>

<%--<div id="map" style="width: 100%; height: 100%"></div>
<script src="js/views/homepage.js"></script>--%>

<style type="text/css">
    .mapquery {
        width: 300px;
        height: 30px;
        font-size: 20px;
        border: solid 1px #eee;
        /*background: #666;*/
        opacity: 0.5;
    }

    .ditubutton {
        width: 35px;
        height: 35px;
        cursor: pointer;
        margin: 10px 0 0 2px;
        opacity: 0.8;
        float: left;
        z-index: 5;
    }
</style>

<div id="r-result" style=" position: fixed;margin: 10px 0 0 100px;z-index: 999;">
    <input type="text" id="suggestId" class="mapquery" />
    <%--<input type="button" id="openDis" value="打开测量工具" onclick="openDis();" />
    <input type="button" id="btnQuery" value="查询" onclick="queryPoint();" />--%>
    <div style="position: fixed; margin: -45px 0 0 302px;">
        <div class="ditubutton" style="background: url('images/chaxun.png'); background-size: 100%;" title="查询" onclick="queryPoint();"></div>
        <div class="ditubutton" style="background: url('images/celiang.png'); background-size: 100%;" title="打开测量工具" onclick="openDis();"></div>
    </div>

    <!-- <input type="button" id="clearDis" value="清除线段" onclick="javasrcipt:{map.clearOverlays();}"/> -->
</div>
<div id="searchResultPanel" style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>
<div id="container" style="height: 100%;"></div>
<script type="text/javascript">
    var map = new BMap.Map("container", { mapType: BMAP_HYBRID_MAP }); // 创建地图实例  
    var point = new BMap.Point(108.952, 34.268); // 创建点坐标  
    map.centerAndZoom(point, 12); // 初始化地图，设置中心点坐标和地图级别

    map.addControl(new BMap.NavigationControl());
    //map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.OverviewMapControl());
    map.addControl(new BMap.MapTypeControl());
    map.enableScrollWheelZoom();
    map.enableInertialDragging();
    map.enableContinuousZoom();
    var size = new BMap.Size(10, 40);
    map.addControl(new BMap.CityListControl({
        anchor: BMAP_ANCHOR_TOP_RIGHT,
        offset: size,
        // 切换城市之间事件
        // onChangeBefore: function(){
        //    alert('before');
        // },
        // 切换城市之后事件
        // onChangeAfter:function(){
        //   alert('after');
        // }
    }));

    var myDis = new BMapLib.DistanceTool(map);
    //map.addEventListener("click", function (e) {
    //    alert(e.point.lng + "," + e.point.lat); 
    //});

    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var ac = new BMap.Autocomplete( //建立一个自动完成的对象
    {
        "input": "suggestId",
        "location": map
    });

    ac.addEventListener("onhighlight", function (e) { //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province + _value.city + _value.district
                + _value.street + _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index
            + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province + _value.city + _value.district
                + _value.street + _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index
            + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function (e) { //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province + _value.city + _value.district
            + _value.street + _value.business;
        G("searchResultPanel").innerHTML = "onconfirm<br />index = "
            + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace() {
        map.clearOverlays(); //清除地图上所有覆盖物
        function myFun() {
            if (local.getResults().OQ < 1) {
                alert("未搜索到相关内容");
                return;
            }

            var pp; //获取第一个智能搜索的结果

            if (local.getResults().OQ == 1) {
                pp = local.getResults().getPoi(0).point;
                var marker = new BMap.Marker(pp, {
                    title: local.getResults().getPoi(0).title
                });
                marker.addEventListener("click", function (e) {
                    var infoWindow = new BMap.InfoWindow(e.target.getTitle()); // 创建信息窗口对象    
                    map.openInfoWindow(infoWindow, e.target.getPosition());
                });
                map.addOverlay(marker); //添加标注
                map.centerAndZoom(pp, 15);
            } else {
                var firstP, endP;
                for (var i = 0; i < local.getResults().OQ; i++) {
                    pp = local.getResults().getPoi(i).point; //获取第一个智能搜索的结果
                    if (i == 0) {
                        firstP = pp;
                    } else if (i == local.getResults().OQ - 1) {
                        endP = pp;
                    }
                    var marker = new BMap.Marker(pp, { title: local.getResults().getPoi(i).title });

                    //bounds.extend(pp);
                    marker.addEventListener("click", function (e) {
                        var infoWindow = new BMap.InfoWindow(e.target.getTitle()); // 创建信息窗口对象    
                        map.openInfoWindow(infoWindow, e.target.getPosition());
                    });
                    map.addOverlay(marker); //添加标注
                }

                var b = new BMap.Bounds(firstP, endP);
                try {    // js中尽然还有try catch方法，可以避免bug引起的错误
                    BMapLib.AreaRestriction.setBounds(map, b); // 已map为中心，已b为范围的地图
                } catch (e) {
                    // 捕获错误异常
                    alert(e);
                }
            }

        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        console.log(myValue);
        local.search(myValue);
    }


    //打开测量工具
    function openDis() {
        //map.clearOverlays();
        myDis.open();
    }

    myDis.addEventListener("drawend", function (e) {
        myDis.close();
    });
</script>

<script type="text/javascript">
    function queryPoint() {
        myValue = $('#suggestId').val();
        setPlace();
        //ac.confirm();
    }

</script>
