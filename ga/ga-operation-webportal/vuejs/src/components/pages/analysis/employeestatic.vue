<template>
    <div class="content" style="margin-left:15px;">
        <Breadcrumb separator="/">
            <BreadcrumbItem href="/">
                <Icon type="android-apps"></Icon>
                数据分析
            </BreadcrumbItem>
            <BreadcrumbItem>经营分析</BreadcrumbItem>
        </Breadcrumb>
        <div style="height: 300px;margin-bottom:50px;">
            <div style="border: 1px solid rgb(1,107,217);margin-top:10px;margin-bottom:18px;float: left;width: 50%;border-right: none;">
                <div id="pilotpie" style="width:100%;height:300px;padding-top:10px;margin-bottom:18px;"></div>
            </div>
            <div style="border: 1px solid rgb(1,107,217);border-left:0px;margin-top:10px;margin-bottom:18px;border-left:0px;float: left;width: 50%;">
                <div id="pilotpie1" style="width:100%;height:300px;padding-top:10px;margin-bottom:18px;"></div>
            </div>
        </div>
        <Row style="height: 40px;">
            <Col span="6">
            <span style="float: left;font-size: 18px;">从</span><DatePicker type="date" placeholder="选择日期" style="width: 200px;float: left" v-model="begaindate" @on-change="getbegaindate"></DatePicker>
            </Col>
            <Col span="6">
            <span style="float: left;font-size: 18px;">到</span><DatePicker type="date" placeholder="选择日期" style="width: 200px;float: left" v-model="enddate" @on-change="getenddate"></DatePicker>
            </Col>
            <input type="button" style="width: 50px;width: 97px;background-color: rgb(1,107,217);height: 30px" @click="gettongji(1)" value="查询"/>
            <input type="button" style="width: 50px;width: 97px;background-color: rgb(1,107,217);height: 30px" @click="gettongjirecent30()" value="最近30天"/>
            <input type="button" style="width: 50px;width: 97px;background-color: rgb(1,107,217);height: 30px" @click="gettongjirecent90()" value="最近3个月"/>
        </Row>

        <div style="height:300px;margin-top:10px;margin-bottom:18px;border: 1px solid rgb(1,107,217);">
            <div id="pilotbar" style="width:100%;height:300px;padding-top:10px;margin-bottom:18px;"></div>
        </div>
        <div class=" active div-list-employeestatic" style="" @click="islogshow1=!islogshow1">
            <div class="name" >
                <div class="logoimgai">
                    <img src="../../../assets/基本信息.png"  >
                </div >
                <div class="name-text">
                    飞行员飞行记录详情统计列表
                </div>
                <div class="name-img">
                    <img v-if="islogshow1" src="../../../assets/减号.png" style="margin-top: 15px">
                    <img v-else src="../../../assets/加号.png" style="margin-top: 8px">
                </div>
            </div>
        </div>
        <div v-show="islogshow1" v-if="tableData!=[]">
            <Table :columns="columns6" :data="tableData" size="default" ref="table" :stripe="true" ></Table>
        </div>
        <div style="margin: 10px;overflow: hidden">
            <div style="float: right;">
                <Page :total="pagecount" :current="1" @on-change="changePage"></Page>
            </div>
        </div>
    </div>

</template>

<script>
    // 引入 ECharts 主模块
    var echarts = require('echarts/lib/echarts');
    // 引入柱状图
    require('echarts/lib/chart/bar');
    require('echarts/lib/chart/line');
    // 引入饼图组件
    require('echarts/lib/chart/pie')
    // 引入提示框和标题组件
    require('echarts/lib/component/tooltip');
    require('echarts/lib/component/title');

    export default {
        data(){
            return {
                islogshow1:true,
                columns6: [
                    {
                        "title": "序号",
                        "key": "employeeId",
                        "fixed": "left",
                        "width": 120
                    },
                    {
                        "title": "违规次数",
                        "key": "flySumIllegal",
                        "sortable": true,
                        "fixed": "left",
                        "width": 120
                    },
                    {
                        "title": "总计时长(小时)",
                        "key": "flySumTime",
                        "sortable": true,
                        "fixed": "left",
                        "width": 180
                    },
                    {
                        "title": "飞行员",
                        "key": "username",
                        "fixed": "left",
                        "width": 200
                    },
                    {
                        "title": "技术级别",
                        "key": "techClass",
                        "fixed": "left",
                        "width": 180
                    },
                    {
                        "title": "所属飞行队",
                        "key": "flightteam",
                        "fixed": "left"
                    }
                ],
                tableData: [
                        {
                            "employeeId": "",
                            "flySumIllegal": "",
                            "flySumTime": "",
                            "username":"",
                            "licenseType":"",
                            "companyName":""
                    }
                ],
                opinionData:[],
                opinionData2:[],
                pagecount:'',
                begaindate:'',
                enddate:''

            }
        },
        created(){
            this.gettongjirecent30();
            this.getData1();
            this.getData2();

        },
        computed: {
            opinionData1: function (){

                let temp = [];
                for (let row of this.opinionData) {
                    temp.push(row)
                }
                return temp;
            },

            opinionData3: function (){

                let temp = [];
                for (let row of this.opinionData2) {
                    temp.push(row)
                }
                return temp;
            },
            xData: function () {
                let temp = []

                for (let row of this.tableData) {
                    temp.push({value: row.username, textStyle: {color: 'red'}})
                }

                return temp;
            },
            yData: function () {
                let temp = []

                for (let row of this.tableData) {
                    temp.push(row.flySumTime)
                }

                return temp;
            },
            zData: function () {
                let temp = []

                for (let row of this.tableData) {
                    temp.push(row.flySumIllegal)
                }

                return temp;
            },

        },
        mounted(){
            this.myChart = echarts.init(document.getElementById('pilotbar'));
            this.myChart1 = echarts.init(document.getElementById('pilotpie'));
            this.myChart2 = echarts.init(document.getElementById('pilotpie1'));
            this.initData();
        },
        methods: {
            gettongjirecent90(){
                let timer = this.timeForMat(90);
                this.begaindate=timer.t2;
                this.enddate=timer.t1;
                this.gettongji(1)

            },
            gettongjirecent30(){
                let timer = this.timeForMat(30);
                this.begaindate=timer.t2;
                this.enddate=timer.t1;
                this.gettongji(1)
            },
            timeForMat(count){
                let time1 = new Date()
                time1.setTime(time1.getTime() - (24 * 60 * 60 * 1000))
                let Y1 = time1.getFullYear()
                let M1 = ((time1.getMonth() + 1) > 10 ? (time1.getMonth() + 1) : '0' + (time1.getMonth() + 1))
                let D1 = (time1.getDate() > 10 ? time1.getDate() : '0' + time1.getDate())
                let timer1 = Y1 + '-' + M1 + '-' + D1 // 当前时间
                let time2 = new Date()
                time2.setTime(time2.getTime() - (24 * 60 * 60 * 1000 * count))
                let Y2 = time2.getFullYear()
                let M2 = ((time2.getMonth() + 1) > 10 ? (time2.getMonth() + 1) : '0' + (time2.getMonth() + 1))
                let D2 = (time2.getDate() > 10 ? time2.getDate() : '0' + time2.getDate())
                let timer2 = Y2 + '-' + M2 + '-' + D2 // 之前的7天或者30天
               return {
                   t1: timer1,
                   t2: timer2
                   }
            },
            getbegaindate(val){
              this.begaindate=val;
            },
            getenddate(val){
                this.enddate=val;
            },
            gettongji(val){
                let self=this;
                self.$profile.getProfile().then((profile) => {
                self.$http.httpGet('/app/api/pilot/search/company/more', {
                    companyId: profile.buz.companyId,
                    page:val,
                    pageSize:10,
                    begaindata:self.begaindate,
                    enddate:self.enddate

                }).then((res) => {
                        let result = res.data;
                        if (result.resultCode == 200) {

                            for(var i=0;i<result.data.length;i++) {
                                if(result.data[i].flySumTime==null){
                                    result.data[i].flySumTime=0;

                                }
                                else {
                                    result.data[i].flySumTime = parseInt(result.data[i].flySumTime) / 3600;
                                    result.data[i].flySumTime = result.data[i].flySumTime.toFixed(2);
                                }
                            }
                            self.tableData = result.data;


                        }
                        else {
                            console.log(result.message)
                        }
                    })
                    self.$http.httpGet('/app/api/pilot/search/company/morecount', {
                        companyId: profile.buz.companyId,
                        begaindata:self.begaindate,
                        enddate:self.enddate
                    }).then((res) => {
                        let result = res.data;
                        if (result.resultCode == 200) {
                            self.pagecount = result.data;
//                        self.tableData.flySumTime=self.tableData.flySumTime/3600;
                        }
                        else {
                            console.log(result.message)
                        }
                    })
                }, (error) => {
                    console.log('error', error);
                });
            },
            changePage(val){
                    this.gettongji(val)
            },
            initData(){
                const option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            crossStyle: {

                            }
                        }
                    },
                    grid: {
                        bottom: 10,
                        top: 10,
                        right: 30,
                        left: 30,
                        containLabel: true
                    },

                    xAxis: [
                        {
                            type: 'category',
                            data: this.xData,
//                            axisPointer: {type: 'shadow'},
                            axisLine: {
                                lineStyle: {
                                    color:'rgb(1,107,217)'
                                }
                            },
                            axisLabel:{
                                color:'rgb(1,107,217)'
                            },
                            splitLine: {
                                lineStyle: {
                                    color:'rgb(1,107,217)'
                                }
                            }
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: '飞行总时长',
//                            min: 0,
//                            max: 1000,
//                            interval: 100,
                            axisLabel: {
                                formatter: '{value} 小时'
                            },
                            axisLine: {
                                lineStyle: {
                                    color:'rgb(1,107,217)'
                                }
                            },

                        },
                        {
                            type: 'value',
                            name: '违规次数',
                            min: 0,
                            max: 10,
                            interval: 1,
                            axisLabel: {
                                formatter: '{value} 次'
                            },
                            axisLine: {
                                lineStyle: {
                                    color:'rgb(1,107,217)'
                                }
                            },
                            splitLine: {
                                lineStyle: {
                                    color:'rgb(1,107,217)'
                                }
                            },
                        }
                    ],
                    series: [
                        {
                            name: '飞行时长',
                            type: 'bar',
                            barWidth: 20,
                            yAxisIndex: 0,
                            itemStyle: {normal: {color: '#0295FD'}},
                            data: this.yData
                        },
                        {
                            name: '违规次数',
                            type: 'line',
                            yAxisIndex: 1,
                            itemStyle: {normal: {color: '#0295FD'}},
                            data: this.zData
                        }
                    ]
                };
                const option1=({
                    title : {
                        text: '企业的各个职位员工分布图',
                        x:'center',
                        textStyle:{color:'white'}
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    color:['#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570'],
//                    color:['green','yellow','blueviolet','white'],

//                    toolbox: {
//                        show: true,
//                        feature: {
//                            mark: {
//                                show: true
//                            },
//                            dataView: {
//                                show: true,
//                                readOnly: false
//                            },
//                            magicType: {
//                                show: true,
//                                type: ['pie']
//                            },
//                            restore: {
//                                show: true
//                            },
//                            saveAsImage: {
//                                show: true
//                            }
//                        }
//                    },
//                    calculable: true,
                    series: [{
                        name: '种类',
                        type: 'pie',
                        // 内圆半径，外圆半径
                        radius: [30, 100],
                        // 位置，左右，上下
                        center: ['50%', '50%'],
//                        roseType: 'area',
                        data: this.opinionData1, // 别忘了this
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }

                    }]
                });
                const option2=({
                    title : {
                        text: '企业的员工受教育程度分布图',
                        x:'center',
                        textStyle:{color:'white'}
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    color:['#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570'],
//                    color:['green','yellow','blueviolet','white'],

//                    toolbox: {
//                        show: true,
//                        feature: {
//                            mark: {
//                                show: true
//                            },
//                            dataView: {
//                                show: true,
//                                readOnly: false
//                            },
//                            magicType: {
//                                show: true,
//                                type: ['pie']
//                            },
//                            restore: {
//                                show: true
//                            },
//                            saveAsImage: {
//                                show: true
//                            }
//                        }
//                    },
//                    calculable: true,
                    series: [{
                        name: '种类',
                        type: 'pie',
                        // 内圆半径，外圆半径
                        radius: [30, 100],
                        // 位置，左右，上下
                        center: ['50%', '50%'],
//                        roseType: 'area',
                        data: this.opinionData3, // 别忘了this
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }

                    }]
                });

                this.myChart.setOption(option);
                this.myChart1.setOption(option1);
                this.myChart2.setOption(option2);
            },
            getData1 () {
                let self = this;
                let role = "company";
                let data = {};
                let companyId;
                let url = '/app/api/employee';
                if (role == "company") {
                    self.$profile.getProfile().then((profile) => {
                        companyId = profile.buz.companyId;
                        url += '/search/findAllEmployeeBycompanyId';
                        data.companyId = companyId;
                        data.page = 1;
                        data.pageSize = 1000;
                        self.$http.httpGet(url, data).then((res) => {
                            let result = res.data;
                            if (res.data.resultCode == 200) {

                                let  result=res.data.data;
                                for(let i=0;i<result.length;i++){
                                    if(result[i][1]=="飞行人员"){
                                        let map={ name: '飞行人员', value: result[i][0] };
                                        self.opinionData.push(map);
                                    }
                                    if(result[i][1]=="航务人员"){
                                        let map1={ name: '航务人员', value: result[i][0] };
                                        self.opinionData.push(map1);
                                    }
                                    if(result[i][1]=="飞行学员"){
                                        let  map2={ name: '飞行学员', value: result[i][0] };
                                        self.opinionData.push(map2);
                                    }
                                    if(result[i][1]=="机务人员"){
                                        let map3={ name: '机务人员', value: result[i][0] };
                                        self.opinionData.push(map3);
                                    }
                                    if(result[i][1]=="其他人员"){
                                        let map4={ name: '其他人员', value: result[i][0] };
                                        self.opinionData.push(map4);
                                    }
                                }
                                console.log(self.opinionData);

                            }
                            else {
                                console.log(result.message)
                            }
                        })
                    }, (error) => {
                        console.log('error', error);
                    });

                }
                else if (role == "supersion") {
                    let supersionId = 1;
                    url += '/search/supersion/more';
                    data.supersionId = supersionId;
                    data.page = 1;
                    data.pageSize = 1000;
                }


            },
            getnumber(val){
                for(var i=0;i<3;i++){
                    if(val[i]== val.max()){
                        return i
                    }
                }
            },
            getData2 () {
                let self = this;
                let role = "company";
                let data = {};
                let companyId;
                let url = '/app/api/employee';
                if (role == "company") {
                    self.$profile.getProfile().then((profile) => {
                        companyId = profile.buz.companyId;
                        url += '/search/findEmployeeeduBycompanyId';
                        data.companyId = companyId;
                        data.page = 1;
                        data.pageSize = 1000;
                        self.$http.httpGet(url, data).then((res) => {
                            let result = res.data;
                            if (res.data.resultCode == 200) {
                                let result = res.data.data;
                                console.log(result)
                                for(let i=0;i<result.length;i++){
                                    if(result[i][1]=="0"){
                                        let map={ name: '博士', value: result[i][0] };
                                        self.opinionData2.push(map);
                                    }
                                    if(result[i][1]=="1"){
                                        let map1={ name: '研究生', value: result[i][0] };
                                        self.opinionData2.push(map1);
                                    }
                                    if(result[i][1]=="2"){
                                        let  map2={ name: '本科', value: result[i][0] };
                                        self.opinionData2.push(map2);
                                    }
                                    if(result[i][1]=="3"){
                                        let map3={ name: '大专', value: result[i][0] };
                                        self.opinionData2.push(map3);
                                    }
                                    if(result[i][1]=="4"){
                                        let map4={ name: '大专以下', value: result[i][0] };
                                        self.opinionData2.push(map4);
                                    }
                                }
//                        console.log(result.data);
//                        let map={ name: '博士', value: result.data[0] };
//                        let map1={ name: '研究生', value: result.data[1] };
//                        let map2={ name: '本科', value: result.data[2] };
//                        let map3={ name: '大专', value: result.data[3] };
//                        let map4={ name: '大专以下', value: result.data[4] };
//                        let arra=[result.data[0],result.data[1],result.data[2],result.data[3],result.data[4]];
//                        arra.sort(function(a,b){return a<b?1:-1});
//                        console.log(arra);
//                        for(var i=0;i<arra.length;i++) {
//                            if (arra[i] == result.data[0] && map.value != 0) {
//                                self.opinionData2.push(map);
//                            } else if (arra[i] == result.data[1] && map1.value != 0) {
//                                self.opinionData2.push(map1);
//                            } else if (arra[i] == result.data[2] && map2.value != 0) {
//                                self.opinionData2.push(map2);
//                            } else if (arra[i] == result.data[3] && map3.value != 0) {
//                                self.opinionData2.push(map3);
//                            } else if (arra[i] == result.data[4] && map4.value != 0) {
//                                self.opinionData2.push(map4);
//                            }
//                        }
                            }
                            else {
                                console.log(result.message)
                            }
                        })
                    }, (error) => {
                        console.log('error', error);
                    });

                }
                else if (role == "supersion") {
                    let supersionId = 1;
                    url += '/search/supersion/more';
                    data.supersionId = supersionId;
                    data.page = 1;
                    data.pageSize = 1000;
                }


            },

            //获取飞行总时长
            getData (val) {
                let self = this;
                let role = "company";
                let data = {}
                let url = '/app/api/pilot';
                let companyId;
                if (role == "company") {
                    self.$profile.getProfile().then((profile) => {
                            companyId = profile.buz.companyId;
                        url += '/search/company/more';
                        data.companyId = companyId;
                        data.page = val;
                        data.pageSize = 10;
                        self.$http.httpGet(url, data).then((res) => {
                            let result = res.data;
                            if (result.resultCode == 200) {

                                for(var i=0;i<result.data.length;i++) {
                                    if(result.data[i].flySumTime==null){
                                        result.data[i].flySumTime=0;

                                    }
                                    else {
                                        result.data[i].flySumTime = parseInt(result.data[i].flySumTime) / 3600;
                                        result.data[i].flySumTime = result.data[i].flySumTime.toFixed(2);
                                    }
                                }
                                self.tableData = result.data;
                            }
                            else {
                                console.log(result.message)
                            }
                        })
                        self.$http.httpGet('/app/api/pilot/search/company/morecount', {
                            companyId: profile.buz.companyId,
                        }).then((res) => {
                            let result = res.data;
                            if (result.resultCode == 200) {
                                self.pagecount = result.data;
//                        self.tableData.flySumTime=self.tableData.flySumTime/3600;
                            }
                            else {
                                console.log(result.message)
                            }
                        })
                    }, (error) => {
                            console.log('error', error);
                        });

                }
                else if (role == "supersion") {
                    let supersionId = 1;
                    url += '/search/supersion/more';
                    data.supersionId = supersionId;
                    data.page = 1;
                    data.pageSize = 1000;
                }


            },

            handleCurrentChange(val) {
                this.currentPage = val;
                this.offset = (val - 1) * this.limit;
            }
        },
        watch: {
           tableData: function(val){
               this.initData()
            },
            opinionData: function(val){
                this.initData()
            },
            opinionData2:function(val){
                this.initData()
            }
        }
    }
</script>
<style>
    .checkbox input[type='checkbox'] {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
        z-index: 2;
        opacity: 0;
    }
    .checkbox {
        width: 15px;
        height: 15px;
        border: 1px solid #ababab;
        position: relative;
        border-radius: 1px;
        display: inline-block;
        vertical-align: middle;
    }
    .tit {
        position: relative;
    }
    .tit {
        padding: 5px 7px 5px 8px;
        border: 1px solid #d6d6d6;
        font-size: 14px;
        color: rgba(255,255,255,.85);
        border-radius: 1px;
    }
    .div-heard-1{
        width: 1009px;
        margin-bottom: 10px;
    }
    .topBar li {
        padding-right: 35px;
        height: 60px;
        background: url(../../../../static/images/topBarright.png) center right no-repeat;
    }
    .topBar {
        display: flex;
        justify-content: space-between;
    }
    .topBar li label.item {
        margin: 0 5px;
        font-size: 16px;
        color: #fff;
        font-style: italic;
        line-height: 60px;
        vertical-align: middle;
    }

    .radio {
        width: 16px;
        height: 16px;
        border: 1px solid #fff;
        position: relative;
        border-radius: 50%;
        display: inline-block;
        vertical-align: middle;
    }
    .radio input[type='radio'] {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
        z-index: 2;
        opacity: 0;
    }


    /*.div-list-employeestatic{*/
        /*width: 100%;*/
        /*height: 35px;*/
        /*background: #272727;*/
        /*font-size: 16px;*/
        /*color: white;*/
        /*padding-top: 7px;*/
        /*border: solid 1px #ececec;*/
    /*}*/
    .div-list-employeestatic{
        width: 980px;
        height: 34px;
        background-color: rgba(255,255,255,0.65) ;
        border:1px solid rgb(1,107,217);
        font-size: 14px;
        font-family: "Microsoft YaHei Regular", "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", Arial, sans-serif;
        color: rgb(1,107,217);
        margin-bottom: 4px;
    }
    .div-list-employeestatic .logoimgai{
        width: 34px;
        float:left;
        vertical-align: middle;
    }
    .name-text{
        float:left;
        margin-left: 16px;
        line-height: 34px
    }
    .name-img{
        float: right;
        margin-right: 11px;
    }
</style>